--// YMDEV FIX LAG HUB v1.0 BETA

local WindUI
local success = pcall(function()
    WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)

if not success or not WindUI then
    local ok2 = pcall(function()
        WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
    end)
    if not ok2 then
        warn("Cannot load WindUI")
        return
    end
end

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local ContentProvider = game:GetService("ContentProvider")
local SoundService = game:GetService("SoundService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local currentLang = "vi"

local Lang = {
    vi = {
        tab_main = "Tối Ưu",
        tab_deep = "Fix Lag Sâu",
        tab_fps = "FPS Boost",
        tab_minecraft = "Minecraft",
        tab_advanced = "Nâng Cao",
        tab_texture = "Texture",
        tab_monitor = "Giám Sát",
        tab_about = "About",
        hub_name = "🌱 YMDEV Fix Lag Hub",
        hub_author = "v1.0 Beta",
        main_section = "🎯 Mức Độ Tối Ưu",
        light_title = "🟢 Light",
        light_desc = "Tắt post effects",
        medium_title = "🟡 Medium",
        medium_desc = "Ẩn vật thể trang trí",
        heavy_title = "🟠 Heavy",
        heavy_desc = "Tối ưu nâng cao",
        ultimate_title = "🔴 Ultimate",
        ultimate_desc = "Tối ưu tối đa",
        lowspec_title = "💻 Low Spec Mode",
        lowspec_desc = "Cho máy yếu",
        auto_section = "🧠 Tự Động",
        smartboost_title = "🧠 Smart Boost",
        smartboost_desc = "Tự động tối ưu theo FPS",
        utility_section = "🛠 Tiện Ích",
        clear_mem_title = "💾 Dọn bộ nhớ",
        clear_mem_desc = "Giải phóng RAM",
        restore_title = "♻️ KHÔI PHỤC",
        restore_desc = "Trả về gốc",
        monitor_section = "📊 Thông Số Real-time",
        monitor_lang_section = "🌐 Ngôn Ngữ / Language",
        fps_label = "🎮 FPS: --",
        fps_desc = "Đang đo...",
        ping_label = "📶 Ping: --",
        ping_desc = "Đang đo...",
        mem_label = "💾 Memory: --",
        mem_desc = "Đang đo...",
        spike_label = "⚡ Spike: 0",
        spike_desc = "Đang đo...",
        uptime_label = "⏱️ Uptime: 0s",
        uptime_desc = "Đang đo...",
        status_label = "⚡ Trạng thái: Đang chạy",
        status_desc = "Script hoạt động",
        reset_title = "🔄 Reset thống kê",
        lang_switch_title = "🌐 Chuyển Ngôn Ngữ",
        lang_switch_desc = "Đổi giữa Tiếng Việt và English",
        status_running = "Đang chạy",
        status_minecraft = "⛏️ Minecraft",
        status_lowspec = "💻 Low Spec",
        status_smartboost = "🧠 Smart Boost",
        status_deepfix = "🔥 Deep Fix",
        status_label_prefix = "Trạng thái: ",
        fps_current_prefix = "FPS hiện tại: ",
        ping_current_prefix = "Ping: ",
        ram_current_prefix = "RAM: ",
        spike_count_prefix = "Số lần tụt FPS: ",
        uptime_prefix = "Đã chạy: ",
        about_version = "📌 Phiên bản: v1.0 Beta",
        about_version_desc = "Bản thử nghiệm đầu tiên - Fix lag sâu cho Roblox",
        about_author = "👨‍💻 Người làm script",
        about_author_desc = "YMDEV",
        about_discord = "💬 Discord Server",
        about_discord_desc = "https://discord.gg/yazG4EuGG",
        about_tiktok = "🎵 TikTok",
        about_tiktok_desc = "https://www.tiktok.com/@ym_nico_nextbot",
        about_contact_section = "📞 Liên Hệ & Hỗ Trợ",
        about_discord_contact = "💬 Discord",
        about_discord_contact_desc = "Tham gia server để nhận hỗ trợ, update mới",
        about_tiktok_contact = "🎵 TikTok",
        about_tiktok_contact_desc = "Theo dõi để xem video hướng dẫn & tips",
        about_email = "📧 Email",
        about_email_desc = "contact.ymdev@gmail.com",
        about_thanks_section = "🎁 Cảm Ơn",
        about_thanks = "Cảm ơn bạn đã sử dụng!",
        about_thanks_desc = "Chúc bạn chơi game vui vẻ và mượt mà 🌱",
    },
    en = {
        tab_main = "Optimize",
        tab_deep = "Deep Fix",
        tab_fps = "FPS Boost",
        tab_minecraft = "Minecraft",
        tab_advanced = "Advanced",
        tab_texture = "Texture",
        tab_monitor = "Monitor",
        tab_about = "About",
        hub_name = "🌱 YMDEV Fix Lag Hub",
        hub_author = "v1.0 Beta",
        main_section = "🎯 Optimization Levels",
        light_title = "🟢 Light",
        light_desc = "Disable post effects",
        medium_title = "🟡 Medium",
        medium_desc = "Hide decorative objects",
        heavy_title = "🟠 Heavy",
        heavy_desc = "Advanced optimization",
        ultimate_title = "🔴 Ultimate",
        ultimate_desc = "Maximum optimization",
        lowspec_title = "💻 Low Spec Mode",
        lowspec_desc = "For weak devices",
        auto_section = "🧠 Automatic",
        smartboost_title = "🧠 Smart Boost",
        smartboost_desc = "Auto-optimize based on FPS",
        utility_section = "🛠 Utilities",
        clear_mem_title = "💾 Clear Memory",
        clear_mem_desc = "Free RAM",
        restore_title = "♻️ RESTORE ALL",
        restore_desc = "Revert to original",
        monitor_section = "📊 Real-time Stats",
        monitor_lang_section = "🌐 Language / Ngôn Ngữ",
        fps_label = "🎮 FPS: --",
        fps_desc = "Measuring...",
        ping_label = "📶 Ping: --",
        ping_desc = "Measuring...",
        mem_label = "💾 Memory: --",
        mem_desc = "Measuring...",
        spike_label = "⚡ Spike: 0",
        spike_desc = "Measuring...",
        uptime_label = "⏱️ Uptime: 0s",
        uptime_desc = "Measuring...",
        status_label = "⚡ Status: Running",
        status_desc = "Script active",
        reset_title = "🔄 Reset Stats",
        lang_switch_title = "🌐 Switch Language",
        lang_switch_desc = "Switch between Vietnamese and English",
        status_running = "Running",
        status_minecraft = "⛏️ Minecraft",
        status_lowspec = "💻 Low Spec",
        status_smartboost = "🧠 Smart Boost",
        status_deepfix = "🔥 Deep Fix",
        status_label_prefix = "Status: ",
        fps_current_prefix = "Current FPS: ",
        ping_current_prefix = "Ping: ",
        ram_current_prefix = "RAM: ",
        spike_count_prefix = "FPS drops: ",
        uptime_prefix = "Running for: ",
        about_version = "📌 Version: v1.0 Beta",
        about_version_desc = "First beta release - Deep lag fix for Roblox",
        about_author = "👨‍💻 Script Author",
        about_author_desc = "YMDEV",
        about_discord = "💬 Discord Server",
        about_discord_desc = "https://discord.gg/yazG4EuGG",
        about_tiktok = "🎵 TikTok",
        about_tiktok_desc = "https://www.tiktok.com/@ym_nico_nextbot",
        about_contact_section = "📞 Contact & Support",
        about_discord_contact = "💬 Discord",
        about_discord_contact_desc = "Join server for support & updates",
        about_tiktok_contact = "🎵 TikTok",
        about_tiktok_contact_desc = "Follow for tutorials & tips",
        about_email = "📧 Email",
        about_email_desc = "contact.ymdev@gmail.com",
        about_thanks_section = "🎁 Thanks",
        about_thanks = "Thank you for using!",
        about_thanks_desc = "Have fun and enjoy smooth gameplay 🌱",
    }
}

local function T(key)
    return Lang[currentLang][key] or key
end

local currentFPS = 60
local currentRAM = 0
local overlayEnabled = true
local overlayGui = nil
local overlayFrame = nil
local fpsLabel = nil
local ramLabel = nil
local spikeLabel = nil

local deepFixEnabled = false
local autoCleanEnabled = false
local antiSpikeEnabled = false
local adaptiveQualityEnabled = false
local spikeCount = 0

local startTime = tick()
local origLighting = {}
local origSky = nil
local hiddenObjects = {}
local storedMaterials = {}
local storedTextures = {}
local storedTerrain = {}
local isMinecraftMode = false
local smartBoost = false
local isLowSpecMode = false

local FPSLabel = nil
local PingLabel = nil
local MemLabel = nil
local SpikeLabel2 = nil
local UptimeLabel = nil
local StatusLabel = nil

local function TrySetFpsCap(fps)
    local methods = {
        function() if setfpscap then setfpscap(fps) return true end return false end,
        function() 
            local ok = pcall(function()
                local UGS = UserSettings():GetService("UserGameSettings")
                if UGS then UGS.FramerateCap = fps end
            end)
            return ok
        end,
        function() 
            pcall(function() settings().Rendering.FramerateCap = fps end)
            return true 
        end,
        function() 
            if sethiddenproperty then 
                local UGS = UserSettings():GetService("UserGameSettings")
                sethiddenproperty(UGS, "FramerateCap", fps)
                return true 
            end 
            return false 
        end,
        function() 
            if syn and syn.set_fps_cap then 
                syn.set_fps_cap(fps) 
                return true 
            end 
            return false 
        end,
    }
    
    for _, method in ipairs(methods) do
        local ok, result = pcall(method)
        if ok and result then return true end
    end
    return false
end

local function CreateOverlay()
    if overlayGui then pcall(function() overlayGui:Destroy() end) end
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "YMDEVOverlay_" .. tostring(math.random(1000, 9999))
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.DisplayOrder = 999999
    
    local parented = false
    pcall(function() gui.Parent = CoreGui parented = true end)
    if not parented then
        pcall(function() gui.Parent = LocalPlayer:WaitForChild("PlayerGui", 5) end)
    end
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 85)
    frame.Position = UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(80, 200, 120)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.2
    stroke.Parent = frame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 18)
    title.Position = UDim2.new(0, 0, 0, 3)
    title.BackgroundTransparency = 1
    title.Text = "🌱 YMDEV Fix Lag v1.0"
    title.TextColor3 = Color3.fromRGB(120, 220, 150)
    title.TextSize = 12
    title.Font = Enum.Font.GothamBold
    title.Parent = frame
    
    local fpsLbl = Instance.new("TextLabel")
    fpsLbl.Size = UDim2.new(1, -12, 0, 16)
    fpsLbl.Position = UDim2.new(0, 6, 0, 22)
    fpsLbl.BackgroundTransparency = 1
    fpsLbl.Text = "🎮 FPS: --"
    fpsLbl.TextColor3 = Color3.fromRGB(80, 255, 120)
    fpsLbl.TextSize = 12
    fpsLbl.Font = Enum.Font.GothamBold
    fpsLbl.TextXAlignment = Enum.TextXAlignment.Left
    fpsLbl.Parent = frame
    
    local ramLbl = Instance.new("TextLabel")
    ramLbl.Size = UDim2.new(1, -12, 0, 16)
    ramLbl.Position = UDim2.new(0, 6, 0, 38)
    ramLbl.BackgroundTransparency = 1
    ramLbl.Text = "💾 RAM: -- MB"
    ramLbl.TextColor3 = Color3.fromRGB(255, 220, 100)
    ramLbl.TextSize = 12
    ramLbl.Font = Enum.Font.GothamBold
    ramLbl.TextXAlignment = Enum.TextXAlignment.Left
    ramLbl.Parent = frame
    
    local spikeLbl = Instance.new("TextLabel")
    spikeLbl.Size = UDim2.new(1, -12, 0, 16)
    spikeLbl.Position = UDim2.new(0, 6, 0, 54)
    spikeLbl.BackgroundTransparency = 1
    spikeLbl.Text = "⚡ Spike: 0"
    spikeLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    spikeLbl.TextSize = 12
    spikeLbl.Font = Enum.Font.GothamBold
    spikeLbl.TextXAlignment = Enum.TextXAlignment.Left
    spikeLbl.Parent = frame
    
    overlayGui = gui
    overlayFrame = frame
    fpsLabel = fpsLbl
    ramLabel = ramLbl
    spikeLabel = spikeLbl
    
    return gui
end

CreateOverlay()

local fpsFrameCount = 0
local fpsLastUpdate = tick()

RunService.RenderStepped:Connect(function()
    fpsFrameCount = fpsFrameCount + 1
    
    local now = tick()
    if now - fpsLastUpdate >= 0.5 then
        local elapsed = now - fpsLastUpdate
        local newFPS = math.floor(fpsFrameCount / elapsed)
        
        if currentFPS > 0 and newFPS < currentFPS * 0.5 and newFPS < 40 then
            spikeCount = spikeCount + 1
        end
        
        currentFPS = newFPS
        fpsFrameCount = 0
        fpsLastUpdate = now
    end
end)

task.spawn(function()
    while task.wait(0.25) do
        if overlayEnabled and fpsLabel and ramLabel and spikeLabel then
            pcall(function()
                fpsLabel.Text = "🎮 FPS: " .. currentFPS
                if currentFPS >= 60 then
                    fpsLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
                elseif currentFPS >= 30 then
                    fpsLabel.TextColor3 = Color3.fromRGB(255, 220, 100)
                else
                    fpsLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                end
            end)
            
            pcall(function()
                local ram = math.floor(Stats:GetTotalMemoryUsageMb())
                currentRAM = ram
                ramLabel.Text = "💾 RAM: " .. ram .. " MB"
                if ram < 500 then
                    ramLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
                elseif ram < 1000 then
                    ramLabel.TextColor3 = Color3.fromRGB(255, 220, 100)
                else
                    ramLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                end
            end)
            
            pcall(function()
                spikeLabel.Text = "⚡ Spike: " .. spikeCount
                if spikeCount < 5 then
                    spikeLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
                elseif spikeCount < 20 then
                    spikeLabel.TextColor3 = Color3.fromRGB(255, 220, 100)
                else
                    spikeLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                end
            end)
        end
    end
end)

local function DeepClean()
    local cleaned = 0
    local myChar = LocalPlayer.Character
    local rootPart = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not rootPart then return 0 end
    
    for _, v in ipairs(Workspace:GetDescendants()) do
        pcall(function()
            if myChar and v:IsDescendantOf(myChar) then return end
            
            if v:IsA("BasePart") and not v.Anchored and v.Parent ~= Workspace then
                if v.Transparency >= 0.99 and v.Size.Magnitude < 5 then
                    v:Destroy()
                    cleaned = cleaned + 1
                end
            end
            
            if v:IsA("ParticleEmitter") and not v.Enabled and v.Parent then
                pcall(function() v:Destroy() end)
                cleaned = cleaned + 1
            end
            
            if v:IsA("Explosion") then
                v:Destroy()
                cleaned = cleaned + 1
            end
        end)
    end
    
    if rootPart then
        for _, v in ipairs(Workspace:GetDescendants()) do
            pcall(function()
                if v:IsA("BasePart") and not v.Anchored and not v:IsDescendantOf(myChar) then
                    local dist = (v.Position - rootPart.Position).Magnitude
                    if dist > 1000 and v.Size.Magnitude < 10 then
                        v:Destroy()
                        cleaned = cleaned + 1
                    end
                end
            end)
        end
    end
    
    return cleaned
end

local function AntiStutter()
    pcall(function()
        if Lighting.FogEnd > 300 then
            Lighting.FogEnd = 300
        end
    end)
    
    pcall(function()
        ContentProvider:ClearContentCache()
    end)
    
    collectgarbage("collect")
    collectgarbage("collect")
end

local function ApplyLOD()
    local myChar = LocalPlayer.Character
    local root = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    for _, v in ipairs(Workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("BasePart") and not v:IsDescendantOf(myChar) then
                local dist = (v.Position - root.Position).Magnitude
                
                if dist < 100 then
                    v.LocalTransparencyModifier = 0
                elseif dist < 300 then
                    if v:IsA("MeshPart") then
                        v.RenderFidelity = Enum.RenderFidelity.Performance
                    end
                elseif dist < 800 then
                    if v:IsA("MeshPart") then
                        v.RenderFidelity = Enum.RenderFidelity.Performance
                    end
                else
                    v.LocalTransparencyModifier = 1
                end
            end
        end)
    end
end

local function KillOtherAnimations()
    local count = 0
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            pcall(function()
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local animator = humanoid:FindFirstChildOfClass("Animator")
                    if animator then
                        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                            track:Stop()
                            count = count + 1
                        end
                    end
                end
            end)
        end
    end
    return count
end

local function DynamicTextureLOD()
    local myChar = LocalPlayer.Character
    local root = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    for _, v in ipairs(Workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("Decal") or v:IsA("Texture") then
                if not v:IsDescendantOf(myChar) then
                    local parent = v.Parent
                    if parent and parent:IsA("BasePart") then
                        local dist = (parent.Position - root.Position).Magnitude
                        if dist > 200 then
                            v.Transparency = 1
                        else
                            v.Transparency = math.min(dist / 200, 0.9)
                        end
                    end
                end
            end
        end)
    end
end

local function KillUnnecessaryEffects()
    local count = 0
    for _, v in ipairs(Workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("ParticleEmitter") then
                if v.Rate > 50 then v.Rate = 20 end
                if not v.Enabled then count = count + 1 end
            end
            if v:IsA("Trail") or v:IsA("Beam") then
                if v.Enabled then
                    v.Enabled = false
                    count = count + 1
                end
            end
            if v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
                count = count + 1
            end
        end)
    end
    return count
end

local function FreezeFarParts()
    local myChar = LocalPlayer.Character
    local root = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not root then return 0 end
    
    local count = 0
    for _, v in ipairs(Workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("BasePart") and not v.Anchored and not v:IsDescendantOf(myChar) then
                local dist = (v.Position - root.Position).Magnitude
                if dist > 500 then
                    v.Anchored = true
                    count = count + 1
                end
            end
        end)
    end
    return count
end

local function DynamicSoundCleanup()
    local count = 0
    for _, v in ipairs(SoundService:GetDescendants()) do
        pcall(function()
            if v:IsA("Sound") and v.Playing then
                if v.Volume < 0.1 then
                    v.Playing = false
                    count = count + 1
                end
            end
        end)
    end
    return count
end

local function AutoQualityAdjust()
    if currentFPS < 30 then
        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 200
            if Camera then Camera.FieldOfView = 70 end
        end)
    elseif currentFPS < 45 then
        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 500
        end)
    end
end

local function DisablePostEffects()
    local count = 0
    for _, v in ipairs(Lighting:GetChildren()) do
        pcall(function()
            if v:IsA("PostEffect") or v:IsA("Atmosphere") then
                v.Enabled = false
                count = count + 1
            end
        end)
    end
    return count
end

local function OptimizeLighting()
    pcall(function()
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 100000
        Lighting.FogStart = 0
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        Lighting.ExposureCompensation = 0
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.OutdoorAmbient = Color3.fromRGB(150, 150, 150)
        Lighting.Ambient = Color3.fromRGB(150, 150, 150)
    end)
end

local function HideDecorParts()
    local myChar = LocalPlayer.Character
    local count = 0
    for _, v in ipairs(Workspace:GetDescendants()) do
        pcall(function()
            if myChar and v:IsDescendantOf(myChar) then return end
            if v:IsA("BasePart") then
                if v.Transparency >= 0.98 and not v.CanCollide then
                    v.LocalTransparencyModifier = 1
                    hiddenObjects[v] = true
                    count = count + 1
                end
            elseif v:IsA("Decal") or v:IsA("Texture") then
                if v.Transparency < 1 then
                    v.Transparency = 1
                    hiddenObjects[v] = true
                    count = count + 1
                end
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") 
                or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
                count = count + 1
            end
        end)
    end
    return count
end

local function OptimizeCharacter()
    local char = LocalPlayer.Character
    if not char then return end
    for _, v in ipairs(char:GetDescendants()) do
        pcall(function()
            if v:IsA("BasePart") or v:IsA("MeshPart") then
                if v.Name ~= "HumanoidRootPart" and v.Name ~= "Head" then
                    v.CastShadow = false
                end
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            end
            if v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            end
            if v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Enabled = false
            end
        end)
    end
end

local function ReduceRenderDistance(studs)
    studs = tonumber(studs) or 500
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return 0 end
    local count = 0
    for _, v in ipairs(Workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("BasePart") and not v:IsDescendantOf(LocalPlayer.Character) then
                local dist = (v.Position - root.Position).Magnitude
                if dist > studs then
                    v.LocalTransparencyModifier = 1
                    hiddenObjects[v] = true
                    count = count + 1
                end
            end
        end)
    end
    return count
end

local function ClearMemory()
    pcall(function()
        ContentProvider:ClearContentCache()
    end)
    collectgarbage("collect")
    collectgarbage("collect")
    collectgarbage("collect")
end

local function DisableTerrain()
    pcall(function()
        local terrain = Workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.Decoration = false
            storedTerrain.WaterWaveSize = terrain.WaterWaveSize
            storedTerrain.WaterWaveSpeed = terrain.WaterWaveSpeed
            storedTerrain.WaterReflectance = terrain.WaterReflectance
            storedTerrain.WaterTransparency = terrain.WaterTransparency
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
            terrain.WaterReflectance = 0
            terrain.WaterTransparency = 1
            return true
        end
    end)
    return false
end

local function RestoreTerrain()
    pcall(function()
        local terrain = Workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.Decoration = true
            if storedTerrain.WaterWaveSize then terrain.WaterWaveSize = storedTerrain.WaterWaveSize end
            if storedTerrain.WaterWaveSpeed then terrain.WaterWaveSpeed = storedTerrain.WaterWaveSpeed end
            if storedTerrain.WaterReflectance then terrain.WaterReflectance = storedTerrain.WaterReflectance end
            if storedTerrain.WaterTransparency then terrain.WaterTransparency = storedTerrain.WaterTransparency end
        end
    end)
end

local function DisableSky()
    pcall(function()
        for _, v in ipairs(Lighting:GetChildren()) do
            if v:IsA("Sky") then 
                origSky = v
                v.Parent = nil 
            end
        end
    end)
end

local function RestoreSky()
    pcall(function()
        if origSky and not origSky.Parent then
            origSky.Parent = Lighting
        end
    end)
end

local function ReduceTextureQuality()
    local count = 0
    for _, v in ipairs(Workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("Decal") or v:IsA("Texture") then
                if v.Transparency < 1 then
                    storedTextures[v] = v.Transparency
                    v.Transparency = 1
                    count = count + 1
                end
            end
        end)
    end
    return count
end

local function RestoreTextures()
    for obj, trans in pairs(storedTextures) do
        pcall(function()
            if obj and obj.Parent then obj.Transparency = trans end
        end)
    end
    storedTextures = {}
end

local function DisableDynamicLights()
    local count = 0
    for _, v in ipairs(Workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("SurfaceLight") then
                v.Enabled = false
                count = count + 1
            end
        end)
    end
    return count
end

local function ReduceMeshDetails()
    local count = 0
    for _, v in ipairs(Workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("MeshPart") then
                v.RenderFidelity = Enum.RenderFidelity.Performance
                v.CastShadow = false
                count = count + 1
            end
        end)
    end
    return count
end

local function ReduceCollision()
    local myChar = LocalPlayer.Character
    local count = 0
    for _, v in ipairs(Workspace:GetDescendants()) do
        pcall(function()
            if v:IsA("BasePart") and not v:IsDescendantOf(myChar) then
                if v.CanCollide and v.Anchored and v.Transparency > 0.5 then
                    v.CanCollide = false
                    count = count + 1
                end
            end
        end)
    end
    return count
end

local function OptimizeGUI()
    local count = 0
    pcall(function()
        local playerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
        if playerGui then
            for _, v in ipairs(playerGui:GetDescendants()) do
                pcall(function()
                    if v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("TextLabel") then
                        if v.Visible and v.Name ~= "YMDEVOverlay" and v.Name ~= "MainFrame" then
                            v.Visible = false
                            hiddenObjects[v] = true
                            count = count + 1
                        end
                    end
                end)
            end
        end
    end)
    return count
end

local function RestoreAll()
    for obj, _ in pairs(hiddenObjects) do
        pcall(function()
            if obj and obj.Parent then
                if obj:IsA("BasePart") then
                    obj.LocalTransparencyModifier = 0
                elseif obj:IsA("Decal") or obj:IsA("Texture") then
                    obj.Transparency = 0
                elseif obj:IsA("GuiObject") then
                    obj.Visible = true
                end
            end
        end)
    end
    hiddenObjects = {}
    
    for obj, mat in pairs(storedMaterials) do
        pcall(function()
            if obj and obj.Parent then
                obj.Material = mat
                obj.CastShadow = true
            end
        end)
    end
    storedMaterials = {}
    
    RestoreTextures()
    RestoreTerrain()
    RestoreSky()
    
    pcall(function()
        Lighting.GlobalShadows = origLighting.GlobalShadows
        Lighting.Brightness = origLighting.Brightness
        Lighting.ClockTime = origLighting.ClockTime
        Lighting.FogEnd = origLighting.FogEnd
        Lighting.Ambient = origLighting.Ambient
        Lighting.OutdoorAmbient = origLighting.OutdoorAmbient
    end)
    
    isMinecraftMode = false
    isLowSpecMode = false
    deepFixEnabled = false
    antiSpikeEnabled = false
    autoCleanEnabled = false
    adaptiveQualityEnabled = false
end

local function MinecraftMode()
    isMinecraftMode = not isMinecraftMode
    if isMinecraftMode then
        local processed = 0
        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.Brightness = 1
            Lighting.ClockTime = 12
            Lighting.FogEnd = 500
            Lighting.FogStart = 100
            Lighting.Ambient = Color3.fromRGB(120, 120, 120)
            Lighting.OutdoorAmbient = Color3.fromRGB(120, 120, 120)
            Lighting.EnvironmentDiffuseScale = 0
            Lighting.EnvironmentSpecularScale = 0
            
            for _, v in ipairs(Lighting:GetChildren()) do
                pcall(function()
                    if v:IsA("PostEffect") or v:IsA("Atmosphere") then
                        v.Enabled = false
                    end
                end)
            end
            
            for _, v in ipairs(Workspace:GetDescendants()) do
                pcall(function()
                    if v:IsA("BasePart") and not v:IsDescendantOf(LocalPlayer.Character) then
                        if not storedMaterials[v] then
                            storedMaterials[v] = v.Material
                        end
                        v.Material = Enum.Material.SmoothPlastic
                        v.Reflectance = 0
                        v.CastShadow = false
                        
                        for _, child in ipairs(v:GetChildren()) do
                            if child:IsA("Decal") or child:IsA("Texture") then
                                child.Transparency = 0.7
                            end
                        end
                        processed = processed + 1
                    end
                    if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") 
                        or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                        v.Enabled = false
                    end
                end)
            end
            
            if Camera then
                Camera.FieldOfView = 70
                Camera.MaxZoomDistance = 200
            end
            
            ClearMemory()
        end)
        return processed
    else
        RestoreAll()
        return 0
    end
end

local function ToggleLowSpecMode()
    isLowSpecMode = not isLowSpecMode
    if isLowSpecMode then
        DisablePostEffects()
        OptimizeLighting()
        HideDecorParts()
        ReduceRenderDistance(200)
        DisableTerrain()
        DisableSky()
        ReduceTextureQuality()
        DisableDynamicLights()
        ReduceMeshDetails()
        ReduceCollision()
        ClearMemory()
        return true
    else
        RestoreAll()
        return false
    end
end

pcall(function()
    origLighting = {
        GlobalShadows = Lighting.GlobalShadows,
        Brightness = Lighting.Brightness,
        ClockTime = Lighting.ClockTime,
        FogEnd = Lighting.FogEnd,
        FogStart = Lighting.FogStart,
        FogColor = Lighting.FogColor,
        Ambient = Lighting.Ambient,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
        ExposureCompensation = Lighting.ExposureCompensation,
    }
end)

local Window = WindUI:CreateWindow({
    Title = "🌱 YMDEV Fix Lag Hub",
    Icon = "zap",
    Author = "v1.0 Beta",
    Folder = "YMDEVFixLagHub",
    Size = UDim2.fromOffset(640, 520),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HasOutline = true,
    Resizable = true,
    ToggleKey = Enum.KeyCode.RightShift,
})

local MainTab = Window:Tab({ Title = T("tab_main"), Icon = "zap" })
local DeepFixTab = Window:Tab({ Title = T("tab_deep"), Icon = "hammer" })
local FpsTab = Window:Tab({ Title = T("tab_fps"), Icon = "gauge" })
local MinecraftTab = Window:Tab({ Title = T("tab_minecraft"), Icon = "box" })
local AdvancedTab = Window:Tab({ Title = T("tab_advanced"), Icon = "sliders" })
local TextureTab = Window:Tab({ Title = T("tab_texture"), Icon = "image" })
local MonitorTab = Window:Tab({ Title = T("tab_monitor"), Icon = "activity" })
local AboutTab = Window:Tab({ Title = T("tab_about"), Icon = "info" })

local function Notify(msg)
    pcall(function()
        WindUI:Notify({
            Title = "🌱 YMDEV Hub",
            Content = msg,
            Duration = 3,
            Icon = "check",
        })
    end)
end

MainTab:Section({ Title = T("main_section") })

MainTab:Button({
    Title = T("light_title"),
    Desc = T("light_desc"),
    Callback = function()
        DisablePostEffects()
        OptimizeLighting()
        OptimizeCharacter()
        Notify("🟢 Light: OK")
    end,
})

MainTab:Button({
    Title = T("medium_title"),
    Desc = T("medium_desc"),
    Callback = function()
        DisablePostEffects()
        OptimizeLighting()
        OptimizeCharacter()
        local n = HideDecorParts()
        Notify("🟡 Medium: " .. n .. " objects")
    end,
})

MainTab:Button({
    Title = T("heavy_title"),
    Desc = T("heavy_desc"),
    Callback = function()
        DisablePostEffects()
        OptimizeLighting()
        OptimizeCharacter()
        HideDecorParts()
        ReduceRenderDistance(300)
        DisableDynamicLights()
        ReduceMeshDetails()
        ClearMemory()
        Notify("🟠 Heavy: OK")
    end,
})

MainTab:Button({
    Title = T("ultimate_title"),
    Desc = T("ultimate_desc"),
    Callback = function()
        DisablePostEffects()
        OptimizeLighting()
        OptimizeCharacter()
        HideDecorParts()
        ReduceRenderDistance(150)
        DisableTerrain()
        DisableSky()
        ReduceTextureQuality()
        DisableDynamicLights()
        ReduceMeshDetails()
        ReduceCollision()
        ClearMemory()
        Notify("🔴 Ultimate: OK!")
    end,
})

MainTab:Button({
    Title = T("lowspec_title"),
    Desc = T("lowspec_desc"),
    Callback = function()
        if ToggleLowSpecMode() then
            Notify("💻 Low Spec: ON")
        else
            Notify("♻️ Low Spec: OFF")
        end
    end,
})

MainTab:Section({ Title = T("auto_section") })

MainTab:Toggle({
    Title = T("smartboost_title"),
    Desc = T("smartboost_desc"),
    Type = "Checkbox",
    Value = false,
    Callback = function(v)
        smartBoost = v
        if v then
            task.spawn(function()
                while smartBoost do
                    task.wait(5)
                    if currentFPS < 20 then
                        DisablePostEffects()
                        OptimizeLighting()
                        HideDecorParts()
                        ReduceRenderDistance(150)
                        ClearMemory()
                    elseif currentFPS < 35 then
                        DisablePostEffects()
                        OptimizeLighting()
                        HideDecorParts()
                        ReduceRenderDistance(300)
                        ClearMemory()
                    elseif currentFPS < 50 then
                        DisablePostEffects()
                        OptimizeLighting()
                        HideDecorParts()
                    end
                end
            end)
            Notify("🧠 Smart Boost: ON")
        else
            Notify("🧠 Smart Boost: OFF")
        end
    end,
})

MainTab:Section({ Title = T("utility_section") })
MainTab:Button({
    Title = T("clear_mem_title"),
    Desc = T("clear_mem_desc"),
    Callback = function() ClearMemory() Notify("💾 Memory cleared!") end,
})
MainTab:Button({ 
    Title = T("restore_title"), 
    Desc = T("restore_desc"), 
    Callback = function()
        RestoreAll()
        Notify("♻️ Restored!")
    end 
})

DeepFixTab:Section({ Title = "🔥 Deep Fix" })

DeepFixTab:Toggle({
    Title = "🔥 Deep Fix Real-time",
    Desc = "Auto clean every 3 seconds",
    Type = "Checkbox",
    Value = false,
    Callback = function(v)
        deepFixEnabled = v
        Notify(v and "🔥 Deep Fix: ON" or "🔥 Deep Fix: OFF")
    end,
})

DeepFixTab:Toggle({
    Title = "⚡ Anti-Stutter",
    Desc = "Prevent lag spikes",
    Type = "Checkbox",
    Value = false,
    Callback = function(v)
        antiSpikeEnabled = v
        Notify(v and "⚡ Anti-Stutter: ON" or "⚡ Anti-Stutter: OFF")
    end,
})

DeepFixTab:Toggle({
    Title = "🧹 Auto Clean (30s)",
    Desc = "Auto clear memory",
    Type = "Checkbox",
    Value = false,
    Callback = function(v)
        autoCleanEnabled = v
        Notify(v and "🧹 Auto Clean: ON" or "🧹 Auto Clean: OFF")
    end,
})

DeepFixTab:Toggle({
    Title = "🎯 Adaptive Quality",
    Desc = "Auto adjust based on FPS",
    Type = "Checkbox",
    Value = false,
    Callback = function(v)
        adaptiveQualityEnabled = v
        Notify(v and "🎯 Adaptive: ON" or "🎯 Adaptive: OFF")
    end,
})

DeepFixTab:Section({ Title = "🛠 Deep Fix Tools" })

DeepFixTab:Button({
    Title = "🧹 Deep Clean Now",
    Callback = function()
        local n = DeepClean()
        ClearMemory()
        Notify("🧹 Cleaned " .. n .. " objects")
    end,
})

DeepFixTab:Button({
    Title = "⚡ Anti-Stutter Now",
    Callback = function()
        AntiStutter()
        Notify("⚡ Anti-Stutter applied")
    end,
})

DeepFixTab:Button({
    Title = "🎯 Apply LOD",
    Callback = function()
        ApplyLOD()
        Notify("🎯 LOD applied")
    end,
})

DeepFixTab:Button({
    Title = "🎬 Kill Other Animations",
    Callback = function()
        local n = KillOtherAnimations()
        Notify("🎬 Killed " .. n .. " animations")
    end,
})

DeepFixTab:Button({
    Title = "✨ Kill Unnecessary Effects",
    Callback = function()
        local n = KillUnnecessaryEffects()
        Notify("✨ Killed " .. n .. " effects")
    end,
})

DeepFixTab:Button({
    Title = "📌 Freeze Far Parts",
    Callback = function()
        local n = FreezeFarParts()
        Notify("📌 Froze " .. n .. " parts")
    end,
})

DeepFixTab:Button({
    Title = "🖼️ Dynamic Texture LOD",
    Callback = function()
        DynamicTextureLOD()
        Notify("🖼️ Texture LOD applied")
    end,
})

DeepFixTab:Button({
    Title = "🔊 Clean Sounds",
    Callback = function()
        local n = DynamicSoundCleanup()
        Notify("🔊 Cleaned " .. n .. " sounds")
    end,
})

DeepFixTab:Section({ Title = "📊 Status" })

DeepFixTab:Button({
    Title = "🔄 Reset Spike Counter",
    Callback = function()
        spikeCount = 0
        Notify("🔄 Spike reset")
    end,
})

FpsTab:Section({ Title = "🚀 FPS Unlocker" })

FpsTab:Button({
    Title = "🚀 Unlock 120 FPS",
    Callback = function()
        if TrySetFpsCap(120) then Notify("🚀 Unlocked 120 FPS")
        else Notify("⚠️ Not supported") end
    end,
})

FpsTab:Button({
    Title = "🚀 Unlock 240 FPS",
    Callback = function()
        if TrySetFpsCap(240) then Notify("🚀 Unlocked 240 FPS")
        else Notify("⚠️ Not supported") end
    end,
})

FpsTab:Button({
    Title = "🚀 Unlock 999 FPS",
    Callback = function()
        if TrySetFpsCap(999) then Notify("🚀 Unlocked 999 FPS")
        else Notify("⚠️ Not supported") end
    end,
})

FpsTab:Button({
    Title = "🔒 Lock 60 FPS",
    Callback = function()
        TrySetFpsCap(60)
        Notify("🔒 Locked 60 FPS")
    end,
})

FpsTab:Slider({
    Title = "🎚️ Custom FPS Cap",
    Step = 10,
    Value = { Min = 30, Max = 999, Default = 120 },
    Callback = function(v) TrySetFpsCap(v) end,
})

FpsTab:Section({ Title = "🎨 Graphics Level" })

FpsTab:Button({
    Title = "🎨 Graphics Level 1",
    Desc = "Lowest - Max FPS",
    Callback = function()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
        Notify("🎨 Level 1")
    end,
})

FpsTab:Button({
    Title = "🎨 Graphics Level 5",
    Desc = "Medium",
    Callback = function()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level05
        end)
        Notify("🎨 Level 5")
    end,
})

FpsTab:Button({
    Title = "🎨 Graphics Level 10",
    Desc = "Highest",
    Callback = function()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level10
        end)
        Notify("🎨 Level 10")
    end,
})

FpsTab:Section({ Title = "🖥️ Overlay" })

FpsTab:Toggle({
    Title = "🖥️ Show FPS + RAM Overlay",
    Type = "Checkbox",
    Value = true,
    Callback = function(v)
        overlayEnabled = v
        if overlayGui then overlayGui.Enabled = v end
        Notify(v and "🖥️ Overlay: ON" or "🖥️ Overlay: OFF")
    end,
})

FpsTab:Button({
    Title = "🔄 Recreate Overlay",
    Callback = function()
        CreateOverlay()
        Notify("🔄 Overlay recreated")
    end,
})

FpsTab:Button({
    Title = "🔄 Reset Position",
    Callback = function()
        if overlayFrame then
            overlayFrame.Position = UDim2.new(0, 10, 0, 10)
            Notify("🔄 Position reset")
        end
    end,
})

MinecraftTab:Section({ Title = "⛏️ Minecraft Mode" })

MinecraftTab:Toggle({
    Title = "⛏️ Enable Minecraft Mode",
    Desc = "Block graphics, high FPS",
    Type = "Checkbox",
    Value = false,
    Callback = function(v)
        local processed = MinecraftMode()
        if isMinecraftMode then
            Notify("⛏️ Minecraft: " .. processed .. " parts")
        else
            Notify("♻️ Minecraft: OFF")
        end
    end,
})

MinecraftTab:Slider({
    Title = "📏 Render Distance",
    Step = 50,
    Value = { Min = 100, Max = 2000, Default = 500 },
    Callback = function(v) ReduceRenderDistance(v) end,
})

AdvancedTab:Section({ Title = "⚙️ Basic" })

AdvancedTab:Toggle({
    Title = "🌑 Disable Shadow",
    Type = "Checkbox",
    Value = false,
    Callback = function(v) Lighting.GlobalShadows = not v end,
})

AdvancedTab:Toggle({
    Title = "🎨 Disable Post Effects",
    Type = "Checkbox",
    Value = false,
    Callback = function(v)
        if v then DisablePostEffects() else
            for _, fx in ipairs(Lighting:GetChildren()) do
                if fx:IsA("PostEffect") then fx.Enabled = true end
            end
        end
    end,
})

AdvancedTab:Slider({
    Title = "🎯 FOV",
    Step = 1,
    Value = { Min = 50, Max = 120, Default = 70 },
    Callback = function(v) if Camera then Camera.FieldOfView = v end end,
})

AdvancedTab:Slider({
    Title = "🌫️ Fog End",
    Step = 500,
    Value = { Min = 500, Max = 100000, Default = 100000 },
    Callback = function(v) Lighting.FogEnd = v end,
})

AdvancedTab:Section({ Title = "🔧 Advanced" })

AdvancedTab:Button({ Title = "🏔️ Disable Terrain", Callback = function()
    if DisableTerrain() then Notify("🏔️ Terrain disabled") end
end })

AdvancedTab:Button({ Title = "☁️ Disable Skybox", Callback = function() 
    DisableSky() 
    Notify("☁️ Skybox disabled") 
end })

AdvancedTab:Button({ Title = "🖼️ Reduce Texture", Callback = function()
    local n = ReduceTextureQuality() 
    Notify("🖼️ " .. n .. " textures")
end })

AdvancedTab:Button({ Title = "💡 Disable Dynamic Lights", Callback = function()
    local n = DisableDynamicLights() 
    Notify("💡 " .. n .. " lights")
end })

AdvancedTab:Button({ Title = "🔺 Reduce Mesh Details", Callback = function()
    local n = ReduceMeshDetails() 
    Notify("🔺 " .. n .. " meshes")
end })

AdvancedTab:Button({ Title = "🧊 Reduce Collision", Callback = function()
    local n = ReduceCollision() 
    Notify("🧊 " .. n .. " collisions")
end })

AdvancedTab:Button({ Title = "🖥️ Hide GUI", Callback = function()
    local n = OptimizeGUI() 
    Notify("🖥️ " .. n .. " GUIs")
end })

TextureTab:Section({ Title = "🖼️ Texture Manager" })

TextureTab:Button({ 
    Title = "🖼️ Hide All Textures", 
    Desc = "Hide all Decal/Texture",
    Callback = function()
        local n = ReduceTextureQuality() 
        Notify("Hidden " .. n .. " textures")
    end 
})

TextureTab:Button({ 
    Title = "♻️ Restore Textures", 
    Desc = "Show hidden textures",
    Callback = function()
        RestoreTextures() 
        Notify("Textures restored")
    end 
})

MonitorTab:Section({ Title = T("monitor_lang_section") })

MonitorTab:Dropdown({
    Title = T("lang_switch_title"),
    Desc = T("lang_switch_desc"),
    Values = { "🇻🇳 Tiếng Việt", "🇬🇧 English" },
    Value = "🇻🇳 Tiếng Việt",
    Callback = function(option)
        if option == "🇬🇧 English" then
            currentLang = "en"
        else
            currentLang = "vi"
        end
        
        if FPSLabel then FPSLabel:SetTitle(T("fps_label")) end
        if PingLabel then PingLabel:SetTitle(T("ping_label")) end
        if MemLabel then MemLabel:SetTitle(T("mem_label")) end
        if SpikeLabel2 then SpikeLabel2:SetTitle(T("spike_label")) end
        if UptimeLabel then UptimeLabel:SetTitle(T("uptime_label")) end
        if StatusLabel then StatusLabel:SetTitle(T("status_label")) end
        
        Notify(currentLang == "vi" and "🇻🇳 Đã chuyển sang Tiếng Việt" or "🇬🇧 Switched to English")
    end,
})

MonitorTab:Section({ Title = T("monitor_section") })

FPSLabel = MonitorTab:Paragraph({ Title = T("fps_label"), Desc = T("fps_desc") })
PingLabel = MonitorTab:Paragraph({ Title = T("ping_label"), Desc = T("ping_desc") })
MemLabel = MonitorTab:Paragraph({ Title = T("mem_label"), Desc = T("mem_desc") })
SpikeLabel2 = MonitorTab:Paragraph({ Title = T("spike_label"), Desc = T("spike_desc") })
UptimeLabel = MonitorTab:Paragraph({ Title = T("uptime_label"), Desc = T("uptime_desc") })
StatusLabel = MonitorTab:Paragraph({ Title = T("status_label"), Desc = T("status_desc") })

MonitorTab:Button({
    Title = T("reset_title"),
    Callback = function() 
        spikeCount = 0 
        Notify(currentLang == "vi" and "🔄 Đã reset!" or "🔄 Reset!") 
    end,
})

task.spawn(function()
    while task.wait(1) do
        pcall(function() 
            if FPSLabel then FPSLabel:SetDesc(T("fps_current_prefix") .. currentFPS) end
        end)
        pcall(function()
            if PingLabel then
                local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
                PingLabel:SetDesc(T("ping_current_prefix") .. ping .. " ms")
            end
        end)
        pcall(function() 
            if MemLabel then MemLabel:SetDesc(T("ram_current_prefix") .. currentRAM .. " MB") end
        end)
        pcall(function() 
            if SpikeLabel2 then SpikeLabel2:SetDesc(T("spike_count_prefix") .. spikeCount) end
        end)
        pcall(function()
            if UptimeLabel then
                local up = math.floor(tick() - startTime)
                UptimeLabel:SetDesc(T("uptime_prefix") .. string.format("%dm %ds", math.floor(up/60), up%60))
            end
        end)
        pcall(function()
            if StatusLabel then
                local status = T("status_running")
                if isMinecraftMode then status = T("status_minecraft")
                elseif isLowSpecMode then status = T("status_lowspec")
                elseif smartBoost then status = T("status_smartboost")
                elseif deepFixEnabled then status = T("status_deepfix")
                end
                StatusLabel:SetDesc(T("status_label_prefix") .. status)
            end
        end)
    end
end)

AboutTab:Section({ Title = "🌱 YMDEV Fix Lag Hub" })

AboutTab:Paragraph({
    Title = T("about_version"),
    Desc = T("about_version_desc"),
})

AboutTab:Paragraph({
    Title = T("about_author"),
    Desc = T("about_author_desc"),
})

AboutTab:Paragraph({
    Title = T("about_discord"),
    Desc = T("about_discord_desc"),
})

AboutTab:Paragraph({
    Title = T("about_tiktok"),
    Desc = T("about_tiktok_desc"),
})

AboutTab:Section({ Title = T("about_contact_section") })

AboutTab:Paragraph({
    Title = T("about_discord_contact"),
    Desc = T("about_discord_contact_desc"),
})

AboutTab:Paragraph({
    Title = T("about_tiktok_contact"),
    Desc = T("about_tiktok_contact_desc"),
})

AboutTab:Paragraph({
    Title = T("about_email"),
    Desc = T("about_email_desc"),
})

AboutTab:Section({ Title = T("about_thanks_section") })

AboutTab:Paragraph({
    Title = T("about_thanks"),
    Desc = T("about_thanks_desc"),
})

task.spawn(function()
    while task.wait(3) do
        if deepFixEnabled then
            pcall(function()
                DeepClean()
                KillUnnecessaryEffects()
                ApplyLOD()
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(30) do
        if autoCleanEnabled then
            pcall(function()
                ClearMemory()
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(5) do
        if adaptiveQualityEnabled then
            pcall(function()
                AutoQualityAdjust()
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(2) do
        if antiSpikeEnabled then
            pcall(function()
                if currentFPS < 30 then
                    AntiStutter()
                    DynamicTextureLOD()
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(5) do
        if deepFixEnabled then
            pcall(function()
                DynamicTextureLOD()
            end)
        end
    end
end)

pcall(function() Window:SelectTab(1) end)

task.wait(1)
Notify("🌱 YMDEV Fix Lag Hub v1.0 Beta ready!")
task.wait(0.5)
Notify("📌 RightShift to hide/show UI")