-- 使得script处理器也能无条件自动上屏
local function auto_select(key, env)

  local engine = env.engine
  local context = engine.context
  local config = engine.schema.config
  local len = string.len(env.engine.context.input)
  local max_len = tonumber(config:get_string('speller/max_code_length'))
  local length_limit = tonumber(config:get_string('speller/length_limit')) or 40
  
  if(length_limit~=nil) then
    if(len > length_limit)  then
      context:pop_input(1)
    end
  end

  if (len >= max_len) then
    local commit_text = context:get_commit_text()
    engine:commit_text(commit_text)
    context:clear()
    return 1 -- kAccepted
  end

  return 2 -- kNoop
end

return auto_select
