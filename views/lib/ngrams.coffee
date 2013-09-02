syntax =
  js: require './syntax/js'
  #html: require './syntax/html'
  #coffee: require './syntax/coffee'

# n-gram size
n = 11

module.exports = ngrams =
  n: n

last = (n, array) ->
  if n then array[-n..] else []

# JavaScript parsing
class ParserEmitter
  constructor: (@emitNgrams, @syntax) ->

  emit: (array) ->
    @emitNgrams last i, array for i in [1..n]

  emitProgram: (program) ->
    @emitNode program, []

  emitNode: (node, path) ->
    # If we have null,
    # append sentinel path
    if !node
      @emit path.concat 'type', null
      return

    # If this is a primitive value, emit it
    if typeof node != 'object'
      @emit path.concat node
      return

    type = node.type
    if !type && node._id?
      type = node[node._id]
      
    # Add the current node type to the path array, and emit it
    if type
      @emit path.concat 'type', type
      path = last n, path.concat type

      # Process node properties
      properties = @syntax[type]
      if !properties
        throw new Error 'Unknown node type ' + type

      @emitObject node, properties, path

    if siblings?
      # Emit next sibling
      @emitNode siblings[i+1], (path.concat 1), siblings, i+1

  emitObject: (node, properties, path) ->
    for key, propType of properties when key[0] != '_'
      value = node[key]
      subpath = path.concat key

      if propType == Array ||
          propType instanceof Array && propType[0] == 'string'
        # Emit first child, and it will emit next sibling
        @emitNode value[0], subpath, value, 0
        @emitArray value, subpath

      else if propType instanceof Array
        @emitObject node, propType[0], subpath

      else if propType in [Boolean, Number, String]
        # Emit property and its literal value
        @emit subpath.concat value

      else if propType == Object ||
          typeof propType == 'string'
        # Emit property and its value, recursively
        @emitNode value, subpath

# Map function
ngrams.map = (doc, emit) ->
  try
    if doc.name.match /\.js$/
      js = syntax.js
      program = js.parse doc.text
      emitter = new ParserEmitter emit, js.syntax
      emitter.emitProgram program
    else if doc.name.match /\.coffee$/
    else if doc.name.match /\.html$/
    else if doc.name.match /\.css$/
    else
      emit 'error', 'unknown file type for ' + doc.name
  catch e
    emit 'error', e

