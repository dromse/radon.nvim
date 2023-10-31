# radon.nvim

[example.webm](https://github.com/dromse/radon.nvim/assets/57846319/c9cf0b61-28d3-456e-9030-fc2734abb679)

Fast generation of react hooks, components and directories.

## Installation

```lua
-- Packer
use 'dromse/radon.nvim'
```

## Usage

```lua
-- Using table argument.
require('radon').generate_state({ name = 'simpleString', value = '"You simple string!"' --[[ or ]] '' })
-- --> const [simpleString, setSimpleString] = useState("You simple string!")

-- Show Vim UI
require('radon').show_generate_state()
-- Input name: simpleString
-- Input default value: 'My simple string!' <-- You can left it empty.
-- --> const [simpleString, setSimpleString] = useState('My simple string!')

-- In UI you can cancel by press Ctrl + C
```
