# flatten-css 

  Flatten CSS file for easy comparison. For example, if you re-write your css in less, you might want to compare the generated css with your original one. 

## Example

css:

```css
.a, .b {
  background: #eee;
  color: #888;
}
```

flattened css:

```css
.a {
  background: #eee;
  color: #888;
}
.b {
  background: #eee;
  color: #888;
}
```

The following two blocks of css are same after flatten
### css1
```css
.a, .b{
  width: 100px;
}

.a, .b{
  background-color: #eee;
}
```
### css2
```css
.b, .a {
  background-color: #eee;
  width: 100px;
}
```
They both flattened as:
```css
.a {
  background-color: #eee;
  width: 100px;
}
.b {
  background-color: #eee;
  width: 100px;
}
```
## Get started
  Install it by calling
```bash
npm install flatten-css
```

  Note: flatten-css will also sort the rules based on each rule's selector

## Running test
```bash
npm run test
```

## License

The MIT License (MIT)

Copyright (c) 2013 viruschidai@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

