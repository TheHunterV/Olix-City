locales = locales or {}
function getLocalizedText(text, ...)
    local message = locales[config.locale][text]
    
    return string.format(message, ...)
end