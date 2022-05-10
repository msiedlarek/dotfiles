local Previewer = {}
Previewer.__index = Previewer

local force_function_wrap = function(value)
  if value ~= nil then
    if type(value) ~= "function" then
      return function()
        return tostring(value)
      end
    else
      return value
    end
  end
end

function Previewer:new(opts)
  opts = opts or {}

  return setmetatable({
    state = nil,
    _title_fn = force_function_wrap(opts.title),
    _dyn_title_fn = force_function_wrap(opts.dyn_title),
    _setup_func = opts.setup,
    _teardown_func = opts.teardown,
    _send_input = opts.send_input,
    _scroll_fn = opts.scroll_fn,
    preview_fn = opts.preview_fn,
  }, Previewer)
end

function Previewer:preview(entry, status)
  if not entry then
    return
  end

  if not self.state then
    if self._setup_func then
      self.state = self:_setup_func(status)
    else
      self.state = {}
    end
  end

  return self:preview_fn(entry, status)
end

function Previewer:title(entry, dynamic)
  if dynamic == true and self._dyn_title_fn ~= nil then
    if entry == nil then
      return nil
    end
    return self:_dyn_title_fn(entry)
  end
  if self._title_fn ~= nil then
    return self:_title_fn()
  end
end

function Previewer:teardown()
  if self._teardown_func then
    self:_teardown_func()
  end
end

function Previewer:send_input(input)
  if self._send_input then
    self:_send_input(input)
  else
    vim.api.nvim_err_writeln "send_input is not defined for this previewer"
  end
end

function Previewer:scroll_fn(direction)
  if self._scroll_fn then
    self:_scroll_fn(direction)
  else
    vim.api.nvim_err_writeln "scroll_fn is not defined for this previewer"
  end
end

return Previewer
