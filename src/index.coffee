fs = require 'fs'
util = require 'util'
parse = require 'css-parse'
_ = require 'underscore'

indentation = '  '

log = (obj) ->
  console.log util.inspect obj, {depth: 10}

mergeDeclarations = (declarations1, declarations2) ->
  hash = {}
  for decl in declarations2
    hash[decl.property] = decl 

  ret = []
  for decl in declarations1
    if !hash[decl.property] 
      ret.push decl 

  ret = ret.concat declarations2
  return _(ret).sortBy (decl) -> decl.property

printRule = (rule, indentation) ->
  console.log "\n#{rule.selector} {"
  for decl in rule.declarations
    console.log "#{indentation}#{decl.property}: #{decl.value};" 

  console.log '};'

generateRuleStr = (rule, indentation) ->
  ret = "#{rule.selector} {\n"
  for decl in rule.declarations
    ret += "#{indentation}#{decl.property}: #{decl.value};\n" 

  ret += '}\n'

expandAndMergeRules = (node) ->
  rules = node.stylesheet.rules

  ret = {}
  for rule in rules when rule.type is 'rule'
    selectors = rule.selectors

    for selector in selectors
      selector = selector.trim()
      if !ret[selector]
        declarations = _.clone rule.declarations
        ret[selector] = _.extend {}, {selector, declarations} 
      else
        declarations = mergeDeclarations ret[selector].declarations, rule.declarations 
        ret[selector].declarations = declarations

  rules = _.values ret
  return _.sortBy rules, (decl) -> decl.selector

module.exports = exports = flattenCss = (cssStr, indentation) ->
  node = parse cssStr
  rules = expandAndMergeRules node

  str = ''
  for rule in rules
    str += generateRuleStr rule, indentation

  return str
