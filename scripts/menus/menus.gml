function exitToDesktop() {
  game_end();
}

function returnToMenuSelection() {
  game_restart();
}

function unpause() {
  global.pause = false;
}

enum Platforms {
  Browser = 0,
    Windows = 1,
    GXGames = 2,
    Linux = 3,
    MacOSX = 4,
    IOS = 5,
    AppleTV = 6,
    Android = 7,
    PS4 = 8,
    PS5 = 9,
    Xbox = 10,
    Switch = 11,
    Desktop = 50,
    Mobile = 51,
    Browsers = 52,
}

/// @func Menu item options
/// @param {Array<Struct.MenuItem>} _platforms List of plateforms. If empty, will be available to all
/// @param {Asset.GMSound} _sound List of plateforms. Sound to play when triggering
/// @param {Real} _selectedOpacity Opacity for selected item
/// @param {Real} _unselectedOpacity Opacity for unselected item
function MenuItemOptions(_platforms = [], _sound = bass_descend1, _selectedOpacity = 1.0, _unselectedOpacity = 0.7) constructor {
  platforms = _platforms;
  sound = _sound;
  selectedOpacity = _selectedOpacity;
  unselectedOpacity = _unselectedOpacity;
}

/// @func Menu item
/// @param {String} _name The text for the option
/// @param {Function} _action The action to execute
/// @param {Struct.MenuItemOptions} _option Options for the item
function MenuItem(_name, _action = undefined, _option = new MenuItemOptions()) constructor {
  name = _name;
  action = _action;
  option = _option;
}


/// @func Menu instance
/// @param {Array<Struct.MenuItem>} _options List of options
function Menu(_options = []) constructor {
  optionSelected = 0;
  options = _options;
  filtered = false;
  overrideSize = undefined;

  _filter = function() {
    var _newOptions = [];
    /// @param {Struct.MenuItem} _element Item element
    array_foreach(self.options, function(_element) {
      if (array_length(_element.option.plateforms) == 0) {
        array_push(_newOptions, _element);
      }

      var _include = false;
      array_foreach(_element.option.plateforms, function(_plateform) {
        if (_plateform == Platforms.Desktop) {
          if (
            global.plateform == Platforms.Linux ||
            global.plateform == Platforms.Windows ||
            global.plateform == Platforms.MacOSX) {
            _include = true;
          }
        } else if (_plateform == Platforms.Mobile) {
          if (
            global.plateform == Platforms.Android ||
            global.plateform == Platforms.IOS ||
            global.plateform == Platforms.AppleTV) {
            _include = true;
          }
        } else if (_plateform == Platforms.Browsers) {
          if (
            global.plateform == Platforms.Browser ||
            global.plateform == Platforms.GXGames) {
            _include = true;
          }
        } else if (global.plateform == _plateform) {

          _include = true;
        }
      })

      if (_include) {
        array_push(_newOptions, _element);
      }
    })

    self.options = _newOptions;
    self.filtered = true;
  }

  step = function(_upPressed, _downPressed) {

    if (!self.filtered) {
      self._filter();
    }
	
	if(array_length(self.options) == 0) {
		return;
	}

    self.optionSelected += (_downPressed - _upPressed);
	
	var _selected = self.options[self.optionSelected];

    if (_downPressed || _upPressed) {
      playSound(_selected.option.sound, 0.3);
    }

    if (self.optionSelected >= array_length(self.options)) {
      self.optionSelected = 0;
    }

    if (self.optionSelected < 0) {
      self.optionSelected = array_length(self.options) - 1;
    }
  }

  render = function(_startX, _startY, _size, _shadow = false) {
	  	  
    if (!self.filtered) {
      self._filter();
    }

    for (var _i = 0; _i < array_length(self.options); _i++) {
      var _print = "";
	  var _current = self.options[_i];
	  var _opacity = 1.0;
	  


      if (_i == self.optionSelected) {
        _print += "> " + _current.name + " <";
		_opacity = (_current.option.selectedOpacity);
      } else {
        _print += (_current.name);
        _opacity = (_current.option.unselectedOpacity);
      }
	  
	  if(_shadow) {
		draw_set_alpha(_opacity - 0.3);	
	
		draw_set_color(c_black);
		draw_text(_startX,  _startY - (_i * _size) + 8, _print);
	
	  }	 
	  
	  draw_set_alpha(_opacity);
	  draw_set_color(c_white);
	  
	  
      draw_text(_startX, _startY + (_i * _size), _print);
      draw_set_alpha(1.0)
    }
  }
  
  execute = function() {
    var _selected = self.options[self.optionSelected];

    if (_selected.action != undefined) {
      _option.action();
    }
	
	playSound(_selected.option.sound, 1);
  }
}

var _returnToGameSelection = new MenuItem("Return to Game Selection", returnToMenuSelection);
var _returnToDesktopMenuItem = new MenuItem("Exit Games", exitToDesktop, new MenuItemOptions([Platforms.Desktop]));
var _continueGame = new MenuItem("Continue", unpause);

function standardOptions() {
	
	return {
		returnToGameSelection:_returnToGameSelection,
		returnToDesktopMenuItem:_returnToDesktopMenuItem,
		continueGame:_continueGame
	}
}