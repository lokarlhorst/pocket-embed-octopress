# Pocket Embed Plugin for Octopress

## Installation

Make sure you have installed ```pocket``` Gem  ```json``` Gem and Rubygems.

```bash
gem install pocket-ruby
```

Copy ```pocket.rb``` to ```youroctopressdirectory/plugins``` and change ```consumer_key``` and ```access_token``` to your own generated credentials.

How to get the keys? Use my ```generate_token.rb``` and instructions from [here](https://github.com/sotsy/pocket-octopress).

Copy ```pocket_small.png``` to ```youroctopressdirectory/source/images```

## Usage

```{% pocket ENTRYNUMBER %}```

You can get the Pocket entrynumber by opening the link in Pocket. It is the long number in the adress bar of your browser.

## More information and live demo

[Demo @ my blog](http://sots.name/blog/2013/10/08/octopress-plugin-to-embed-pocket-links-with-shortcode/)

## License

Copyright (c) 2013 Philipp Jaeckel
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Pocket Logo is Licensed and has Copyright from [Pocket](https://getpocket.com) - Read it later Inc. Please read the [Terms of Service from Pocket](http://getpocket.com/tos). Usage of Logo is allowed for this Plugin.
