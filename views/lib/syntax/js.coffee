js = module.exports
#esprima = null
esprima = require '../esprima/esprima'

js.parse = (text) ->
  #esprima ||= require '../esprima'
  esprima.parse text

js.syntax =
  Program:
    body: Array

  Function:
    id: 'Identifier'
    params: Array
    defaults: Array
    rest: Object
    body: Array
    expression: Boolean
    generator: Boolean

  EmptyStatement: {}

  BlockStatement:
    body: Array

  ExpressionStatement:
    expression: Object

  IfStatement:
    test: Object
    consequent: Object
    alternate: Object

  LabeledStatement:
    label: 'Identifier'
    body: Object

  BreakStatement:
    label: Object

  ContinueStatement:
    label: Object

  WithStatement:
    object: Object
    body: Object

  SwitchStatement:
    discriminant: Object
    cases: ['SwitchCase']
    lexical: Boolean

  ReturnStatement:
    argument: Object

  ThrowStatement:
    argument: Object

  TryStatement:
    block: 'BlockStatement'
    handler: Object
    guardedHandlers: ['CatchClause']
    finalizer: Object

  WhileStatement:
    test: Object
    body: Object

  DoWhileStatement:
    test: Object
    body: Object

  ForStatement:
    init: Object
    test: Object
    update: Object
    body: Object

  ForInStatement:
    left: Object
    right: Object
    body: Object
    each: Boolean

  ForOfStatement:
    left: Object
    right: Object
    body: Object

  LetStatement:
    head: Object
    body: Object

  FunctionDeclaration:
    id: 'Identifier'
    params: Array
    defaults: Array
    rest: Object
    body: Object
    generator: Boolean
    expression: Boolean

  VariableDeclaration:
    declarations: ['VariableDeclarator']
    kind: String

  VariableDeclarator:
    id: Object
    init: Object

  ThisExpression: {}

  ArrayExpression:
    elements: Array

  ObjectExpression:
    properties: [
      _id: 'key'
      key: Object
      value: Object
      kind: String
    ]

  FunctionExpression:
    id: Object
    params: Array
    defaults: Array
    rest: Object
    body: Object
    generator: Boolean
    expression: Boolean

  SequenceExpression:
    expressions: Array

  UnaryExpression:
    operator: String
    prefix: Boolean
    argument: Object

  BinaryExpression:
    operator: String
    left: Object
    right: Object

  AssignmentExpression:
    operator: String
    left: Object
    right: Object

  UpdateExpression:
    operator: String
    argument: Object
    prefix: Boolean

  LogicalExpression:
    operator: 'LogicalOperator'
    left: Object
    right: Object

  ConditionalExpression:
    test: Object
    alternate: Object
    consequent: Object

  NewExpression:
    callee: Object
    arguments: Array

  CallExpression:
    callee: Object
    arguments: Array

  MemberExpression:
    object: Object
    property: Object
    computed: Boolean

  YieldExpression:
    argument: Object

  ComprehensionExpression:
    body: Object
    blocks: ['ComprehensionBlock']
    filter: Object

  GeneratorExpression:
    body: Object
    blocks: ['ComprehensionBlock']
    filter: Object

  GraphExpression:
    index: Number
    expression: 'Literal'

  GraphIndexExpression:
    index: Number

  LetExpression:
    head: [
      _id: 'id'
      id: Object
      init: Object
    ]
    body: Object

  ObjectPattern:
    properties: [
      _id: 'key'
      key: Object
      value: Object
    ]

  ArrayPattern:
    elements: Array

  SwitchCase:
    test: Object
    consequent: Array

  CatchClause:
    param: Object
    guard: Object
    body: 'BlockStatement'

  ComprehensionBlock:
    left: Object
    right: Object
    each: Boolean

  Identifier:
    name: String

  Literal:
    value: Object

