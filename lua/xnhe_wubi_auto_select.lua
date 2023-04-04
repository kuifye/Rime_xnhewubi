-- 使得处理器能够处理上屏
function split(str,delimiter)
  local dLen = string.len(delimiter)
  local newDeli = ''
  for i=1,dLen,1 do
      newDeli = newDeli .. "["..string.sub(delimiter,i,i).."]"
  end

  local locaStart,locaEnd = string.find(str,newDeli)
  local arr = {}
  local n = 1
  while locaStart ~= nil
  do
      if locaStart>0 then
          arr[n] = string.sub(str,1,locaStart-1)
          n = n + 1
      end

      str = string.sub(str,locaEnd+1,string.len(str))
      locaStart,locaEnd = string.find(str,newDeli)
  end
  if str ~= nil then
      arr[n] = str
  end
  return arr
end

function last_code_is_space(script_text) 
  if (string.sub(script_text,-1) == '_') then
    return true
  else
    return false
  end
end

function last_code_is_semicolon(script_text) 
  if (string.sub(script_text,-1) == ';') then
    return true
  else
    return false
  end
end

function last_code_is_commitkey(script_text) 
  if (last_code_is_semicolon(script_text) or last_code_is_space(script_text)) then
    return true
  else
    return false
  end
end

local function xnhe_wubi_auto_select(key, env)

  local engine = env.engine
  local context = engine.context
  local config = engine.schema.config
  local len = #env.engine.context.input
  local auto_code = tonumber(config:get_string('speller/auto_code')) or 0                  --------------------手动或自动识别上屏
  local auto_select_phrase = config:get_string('speller/auto_select_phrase') or 'true'    --------------------是否自动上屏
  local commit_key = 'space' 
  local commit_key_code = '_' 
  local commit_key_semicolon = 'semicolon'
  local commit_key_semicolon_code = ';'
  local commit_key_apostrophe = 'apostrophe'
  local commit_key_flag = false

  if (key:repr() == commit_key or key:repr() == commit_key_semicolon or key:repr() == commit_key_apostrophe) then                --判断当前输入是否为空格或分号
    commit_key_flag = true
  end

  if(auto_select_phrase == 'true') then
    if (len <= 1 and commit_key_flag) then
      if (key:repr() == commit_key_semicolon) then
        context:push_input(';')   
      end
      if (key:repr() == commit_key_apostrophe) then
        context:push_input("'")  
      end
      if (key:repr() == commit_key) then
        context:push_input(" ")  
      end
      local commit_text = context:get_commit_text()
      engine:commit_text(commit_text)
      context:clear()
      return 1 -- kAccepted
    end

    if (len > 1 and commit_key_flag) then
      if (key:repr() == commit_key_semicolon) then
        context:push_input(';')   
      end
      if (key:repr() == commit_key_apostrophe) then
        context:push_input("'")  
      end
      if (context:has_menu() == false)then     --如果没有对应的词汇就去掉空格直到有一个对应的词为止
        context:pop_input(1) 
      end
      local commit_text = context:get_commit_text()
      engine:commit_text(commit_text)
      context:clear()
      return 1 -- kAccepted
    end
  end

  if (auto_code ~= 0 and len >= auto_code ) then                                                        ------------------------------------n码上屏
    local script_text = context:get_script_text()    --获取带分词的编码
    split_text = {}                                  --命名编码数组
    split_text = split(script_text, " ")             --以空格分割编码，放入命名好的数组内
    if(#split_text>=2 and #split_text[#split_text-1] == 3 and #split_text[#split_text] == 1)then  --x31上屏留1
      context:pop_input(4)
      local commit_text = context:get_commit_text()
      engine:commit_text(commit_text)
      context:clear()
      context:push_input(split_text[#split_text-1]) 
      context:push_input(split_text[#split_text]) 
      return 2 -- kAccepted
    elseif(#split_text>=2 and #split_text[#split_text-1] == 2 and #split_text[#split_text] == 1)then  --x21上屏留1
      context:pop_input(3)
      local commit_text = context:get_commit_text()
      engine:commit_text(commit_text)
      context:clear()
      context:push_input(split_text[#split_text-1]) 
      context:push_input(split_text[#split_text]) 
      return 2 -- kAccepted
    elseif(#split_text>=2 and #split_text[#split_text-1] == 1 and #split_text[#split_text] == 1)then  --x11上屏留2
      context:pop_input(2)
      local commit_text = context:get_commit_text()
      engine:commit_text(commit_text)
      context:clear()
      context:push_input(split_text[#split_text-1]) 
      context:push_input(split_text[#split_text]) 
      return 2 -- kAccepted
    elseif(#split_text[#split_text] == 1)then  --x1上屏留1
      context:pop_input(#split_text[#split_text-1]+1)
      local commit_text = context:get_commit_text()
      engine:commit_text(commit_text)
      context:clear()
      context:push_input(split_text[#split_text-1]) 
      context:push_input(split_text[#split_text]) 
      return 2 -- kAccepted
    elseif(string.sub(split_text[#split_text],-1) == "'")then  --x'上屏
      local commit_text = context:get_commit_text()
      engine:commit_text(commit_text)
      context:clear()
      return 2 -- kAccepted
    elseif(#split_text>=2 and #split_text[#split_text] >= 7)then     --x7上屏
      local commit_text = context:get_commit_text()
      engine:commit_text(commit_text)
      context:clear()
      return 2 -- kAccepted
    elseif(#split_text>=2 and #split_text[#split_text] >= 2)then     --x2上屏
      context:pop_input(#split_text[#split_text-1]+#split_text[#split_text])
      local commit_text = context:get_commit_text()
      engine:commit_text(commit_text)
      context:clear()
      context:push_input(split_text[#split_text-1]) 
      context:push_input(split_text[#split_text]) 
      return 2 -- kAccepted
    else
      local commit_text = context:get_commit_text()
      engine:commit_text(commit_text)
      context:clear()
      return 2 -- kAccepted
    end
  end

  if (commit_key_flag) then                                          -- 连按两次空格上屏
    if (last_code_is_commitkey(script_text)) then
      local commit_text = context:get_commit_text()
      engine:commit_text(commit_text)
      context:clear()
      return 1
    end
  end

  return 2 -- kNoop
end

return xnhe_wubi_auto_select