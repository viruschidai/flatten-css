assert = require 'assert'
fs = require('fs')
path = require('path')
read = fs.readFileSync
readdir = fs.readdirSync

flattenCss = require '../src/index'

describe 'flattenCss()', ->
  readdir('test/cases').forEach (file) ->
    if ~file.indexOf '-flattened' then return
    file = path.basename file, '.css'

    it 'should flatten ' + file, -> 
      css = read path.join('test', 'cases', file + '.css'), 'utf8'
      flattened = read path.join('test', 'cases', file + '-flattened.css'), 'utf8'
      ret = flattenCss css, '  '
      assert.equal ret, flattened
