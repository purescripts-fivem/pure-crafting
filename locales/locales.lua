Language = {}

function _Lang(key)
    local lang = Config.language
    if not Language[lang] then
        lang = 'en'
    end
    local value = Language[lang]
    for k in key:gmatch("[^.]+") do
        if not value then
          debugPrint("Missing locale for: " .. key)
          return ""
        end
        value = value[k]
    end
    return value
end