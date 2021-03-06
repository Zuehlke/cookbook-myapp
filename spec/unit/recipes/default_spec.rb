#
# Cookbook:: myapp
# Spec:: default
#
# The MIT License (MIT)
#
# Copyright:: 2019, Zuehlke Engineering GmbH
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'spec_helper'

describe 'myapp::default' do
  context 'on Ubuntu' do
    platform 'ubuntu'
    it { is_expected.to install_package('apache2') }
    it { is_expected.to start_service('apache2') }
    it { is_expected.to render_file('/var/www/html/index.html').with_content 'Hello from john doe!' }

    context 'with custom greeter configured' do
      default_attributes['myapp']['greeter'] = 'peter parker'
      it { is_expected.to render_file('/var/www/html/index.html').with_content 'Hello from peter parker' }
    end

    context 'on 18.04' do
      platform 'ubuntu', '18.04'
      it { is_expected.to render_file('/var/www/html/index.html').with_content 'ubuntu 18.04' }
    end

    context 'on 16.04' do
      platform 'ubuntu', '16.04'
      it { is_expected.to render_file('/var/www/html/index.html').with_content 'ubuntu 16.04' }
    end
  end
end
