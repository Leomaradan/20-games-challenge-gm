function ExitToDesktop() {
  game_end();
}

function ReturnToMenuSelection() {
  game_restart();
}

function Unpause() {
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

/// @func Menu item
/// @param {String} _name The text for the option
/// @param {Function} _action The action to execute
/// @param {Array<Struct.MenuItem>} _platforms List of plateforms. If empty, will be available to all
function MenuItem(_name, _action = undefined, _platforms = []) constructor {
  name = _name;
  action = _action;
  plateforms = _platforms;
}



/// @func Menu instance
/// @param {Array<Struct.MenuItem>} _options List of options
function Menu(_options = []) constructor {
  optionSelected = 0;
  options = _options;
  filtered = false;

  _filter = function() {
    var _newOptions = [];
    /// @param {Struct.MenuItem} _element Item element
    array_foreach(self.options, function(_element) {
      if (array_length(_element.plateforms) == 0) {
        array_push(_newOptions, _element);
      }

      var _include = false;
      array_foreach(_element.plateforms, function(_plateform) {
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

    self.optionSelected += (_downPressed - _upPressed);

    if (_downPressed || _upPressed) {
      PlaySound(bass_descend1, 0.3);
    }

    if (self.optionSelected >= array_length(self.options)) {
      self.optionSelected = 0;
    }

    if (self.optionSelected < 0) {
      self.optionSelected = array_length(self.options) - 1;
    }
  }

  render = function(_startX, _startY, _size) {

    if (!self.filtered) {
      self._filter();
    }

    for (var _i = 0; _i < array_length(self.options); _i++) {
      var _print = "";

      if (_i == self.optionSelected) {
        _print += "> " + (self.options[_i].name + " <";
      } else {
        _print += (self.options[_i].name);
        draw_set_alpha(0.7);
      }
      draw_text(_startX, _startY + (_i * _size), _print);
      draw_set_alpha(1.0)
    }
  }

  execute = function() {
    var _option = self.options[self.optionSelected];

    if (_option.action != undefined) {
      _option.action();
      PlaySound(bass_descend1, 1);
    }
  }
}