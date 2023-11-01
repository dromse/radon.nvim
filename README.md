# radon.nvim

> [!WARNING]
> 🚧 in dev stage

## 📜 Intro
_radon.nvim_ is a Neovim plugin that allows you to quickly and easily generate React hooks, components, and directories using a simple Vim UI. It is a great tool for React developers of all experience levels, from beginners to experts.

To use _radon.nvim_, simply type `:Radon` in Neovim to open the plugin menu. From here, you can select the type of React hooks, components or directories you want to generate and enter some basic information about it. _radon.nvim_ will then generate it for you.

Here are some of the benefits of using _radon.nvim_:

* **Speed:** _radon.nvim_ is very fast, and it can generate a new React hooks, components and directories from any place in seconds.
* **Ease of use:** _radon.nvim_ has a simple and intuitive Vim UI, making it easy to use for developers of all experience levels.
* **Flexibility:** _radon.nvim_ allows you to customize the generated code to your specific needs.

If you are looking for a way to speed up your React development workflow, then _radon.nvim_ is the plugin for you. Give it a try today!

## 📦 Install

1. Install via your favorite package manager

```lua
-- Packer
use 'dromse/radon.nvim'
```

2. Setup the plugin in your `init.lua`
   
```lua
require('radon').setup()
``` 

## 🚀 Usage

To generate a new React hook like useState, you would type the following command in Neovim:

```
:Radon state
```

_radon.nvim_ would then provide prompts for name and value to generate hook line:

> [!NOTE]
> To cancel operation press _`Ctrl + C`_

```txt
Input name: myState
Input default value: 'My first generated state!'
```

we got line with our hook:

```javascript
import React from 'react';

export function MyComponent() {
  const [myState, setMyState] = useState('My first generated state!')
  return (
    <div>
      <h1>My Component</h1>
    </div>
  );
}
```

You can then customize the code to your needs as required.
