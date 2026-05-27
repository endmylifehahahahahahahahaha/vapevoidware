
local v1 = {}

local function u5(p2)
    if not isfile('vape/' .. p2) then
        local v3, v4 = pcall(function()
            return game:HttpGet('https://raw.githubusercontent.com/endmylifehahahahahahahahaha/vapevoidware/' .. readfile('vape/commithash.txt') .. '/' .. p2, true)
        end)

        assert(v3, v4)
        assert(v4 ~= '404: Not Found', v4)

        if p2:find('.lua') then
            v4 = '--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n' .. v4
        end

        writefile('vape/' .. p2, v4)
    end

    return readfile('vape/' .. p2)
end

function v1.CustomWS(p6, p7, p8)
    local v9 = loadstring(u5('Libraries/WebhookService.lua'))()
    local v10 = v9:new()
    local v11 = 'https://webhook.lewisakura.moe/api/webhooks/1260321777989714030/p1WBwc3IXvQZ55TW5ANBVSjmhACEsmElPLGXWxezR4in-qD_0I3LFy0cDTjciJJykB_B'

    if p7 == 404 then
        v10.Title = 'Bug Report'

        if p6 == nil then
            v10.Description = 'Voidware Auto Bug Report Systems has reported an error'
        else
            v10.Description = p6.DisplayName .. '(@' .. p6.Name .. ') has reported an error'
        end

        v10.Content = 'Error Report'
        p8 = tostring(p8)
        v10.Fields = {
            {
                name = 'Bug Report',
                value = 'Error code: ' .. p8,
                inline = false,
            },
        }
    end
    if p7 == 1 then
        v10.Title = 'Suggestion'
        v10.Description = p6.DisplayName .. '(@' .. p6.Name .. ') has made a suggestion.'
        v10.Content = 'Suggestion'
        v10.Fields = {
            {
                name = 'Suggestion',
                value = 'Suggestion: ' .. tostring(p8),
                inline = false,
            },
        }
    end

    v10.Color = v9.colors.black
    v10.Thumbnail = 'https://webhook.lewisakura.moe/api/webhooks/1260321777989714030/p1WBwc3IXvQZ55TW5ANBVSjmhACEsmElPLGXWxezR4in-qD_0I3LFy0cDTjciJJykB_B'
    v10.Footer = 'Voidware Reporting Systems'
    v10.TimeStamp = DateTime.now():ToIsoDate()

    v10:sendEmbed(v11)
end
function v1.StaffDetector(p12, p13)
    local v14 = tostring(p12)
    local v15 = tostring(p13)
    local v16 = v14 == nil and '5774246' or tostring(p12)
    local v17 = v15 == nil and '79029254' or tostring(p13)
    local v18 = request({
        Url = 'https://roblox-group-user-tracker.p.rapidapi.com/get_user_status' .. '?' .. 'group_id=' .. v16 .. '&role_id=' .. v17,
        Method = 'GET',
        Headers = {
            ['API-Key'] = 'API_erchoMR',
            ['X-RapidAPI-Key'] = '9319f6bb47msh2f96adc6f84754ap1b87cajsn678e2f1c13ca',
            ['X-RapidAPI-Host'] = 'roblox-group-user-tracker.p.rapidapi.com',
        },
    })
    local _HttpService = game:GetService('HttpService')
    local v20 = {}
    local v21 = {}
    local v22 = {}

    if not v18 then
        warn('Error occurred: Request failed')

        return 'Error. Didnt get response while using StaffDetector!'
    end
    if v18.StatusCode ~= 200 then
        local v23, v24, v25 = pairs(v18)
        local v26 = ''

        while true do
            local v27

            v25, v27 = v23(v24, v25)

            if v25 == nil then
                break
            end

            v26 = v26 .. tostring(v18[v25])
        end

        return 'Error. Got response but failed! Data: ' .. v26
    end

    local v28 = _HttpService:JSONDecode(v18.Body)
    local _ = v28.online_users_count
    local _users_status = v28.users_status
    local v30, v31, v32 = pairs(_users_status)

    while true do
        local v33, _ = v30(v31, v32)

        if v33 == nil then
            break
        end

        local v34, v35, v36 = pairs(_users_status[v33])

        v32 = v33

        while true do
            local v37

            v36, v37 = v34(v35, v36)

            if v36 == nil then
                break
            end

            print(_users_status[v33][v36])

            if _users_status[v33].status == 'Game' then
                table.insert(v21, {
                    Name = _users_status[v33].username,
                    DisplayName = _users_status[v33].display_name,
                    Rank = _users_status[v33].role_name,
                })
            end
            if _users_status[v33].status == 'Offline' then
                table.insert(v22, {
                    Name = _users_status[v33].username,
                    DisplayName = _users_status[v33].display_name,
                    Rank = _users_status[v33].role_name,
                })
            end
            if _users_status[v33].status == 'Online' then
                table.insert(v20, {
                    Name = _users_status[v33].username,
                    DisplayName = _users_status[v33].display_name,
                    Rank = _users_status[v33].role_name,
                })
            end
        end

        print('----------------')
    end

    local v38, v39, v40 = pairs(v21)

    while true do
        local v41

        v40, v41 = v38(v39, v40)

        if v40 == nil then
            break
        end

        print(v21[v40].Name)
        print('------------')
    end

    return {v21, v22, v20}
end

return v1