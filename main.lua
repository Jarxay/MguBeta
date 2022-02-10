Library = loadstring(game:HttpGet('https://lindseyhost.com/UI/LinoriaLib.lua'))();
local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()
local Fonts = {};
for Font, _ in next, Drawing.Fonts do
	table.insert(Fonts, Font);
end;

local function TeleportAll()
    print("Function: TeleportAll - Success")
    for i,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
        plr.Character.HumanoidRootPart.CFrame = v.CFrame
        wait()
    end
end;

local function SpawnTPFunc()
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(26,4,34)
end;

local TestWindow = Library:CreateWindow("MGU 2.0");
Library:SetWatermark('MGU : '.. plr.Name.. ' : Beta');
Library:Notify('Loading UI...');

local MainTab = TestWindow:AddTab('Main');
local PlayerTab = TestWindow:AddTab('LocalPlayer');
local MainTabBox1 = MainTab:AddLeftTabbox('Autoswing');
local MainTabBox2 = MainTab:AddRightTabbox('Autosell');
local MainTabBox3 = MainTab:AddRightTabbox('Unlock all islands');
local Autoswing = MainTabBox1:AddTab('Autoswing');
local Autosell = MainTabBox2:AddTab('Autosell');
local UnlockAll = MainTabBox3:AddTab('Unlock all islands');


Autoswing:AddToggle('Autoswing', { Text = 'Autoswing' });
Autosell:AddToggle('Autosell', { Text = 'Autosell' });
UnlockAll:AddButton('Unlock all islands', TeleportAll);

local TeleportTab = TestWindow:AddTab('Teleports (beta)');
local TeleportBox1 = TeleportTab:AddLeftTabbox('Teleports');
local TeleportText = TeleportBox1:AddTab('Teleports');
TeleportText:AddButton('Spawn', SpawnTPFunc);

local PlayerTabBox1 = PlayerTab:AddLeftTabbox('Speed');
local PlayerTabBox2 = PlayerTab:AddRightTabbox('High Jump');
local Speed = PlayerTabBox1:AddTab('Speed');
Speed:AddToggle('Speed', { Text = "Speed"})

local HighJump = PlayerTabBox2:AddTab('High Jump');
HighJump:AddToggle('HighJump', { Text = "HighJump"})



local Teleport
local SettingsTab = TestWindow:AddTab('Settings');

local function UpdateTheme()
    Library.BackgroundColor = Options.BackgroundColor.Value;
    Library.MainColor = Options.MainColor.Value;
    Library.AccentColor = Options.AccentColor.Value;
    Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);
    Library.OutlineColor = Options.OutlineColor.Value;
    Library.FontColor = Options.FontColor.Value;

    Library:UpdateColorsUsingRegistry();
end;

local function SetDefault()
    Options.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Options.MainColor:SetValueRGB(Color3.fromRGB(28, 28, 28));
    Options.BackgroundColor:SetValueRGB(Color3.fromRGB(20, 20, 20));
    Options.AccentColor:SetValueRGB(Color3.fromRGB(0, 85, 255));
    Options.OutlineColor:SetValueRGB(Color3.fromRGB(50, 50, 50));
    Toggles.Rainbow:SetValue(false);

    UpdateTheme();
end;

local Theme = SettingsTab:AddLeftGroupbox('Theme');
Theme:AddLabel('Background Color'):AddColorPicker('BackgroundColor', { Default = Library.BackgroundColor });
Theme:AddLabel('Main Color'):AddColorPicker('MainColor', { Default = Library.MainColor });
Theme:AddLabel('Accent Color'):AddColorPicker('AccentColor', { Default = Library.AccentColor });
Theme:AddToggle('Rainbow', { Text = 'Rainbow Accent Color' });
Theme:AddLabel('Outline Color'):AddColorPicker('OutlineColor', { Default = Library.OutlineColor });
Theme:AddLabel('Font Color'):AddColorPicker('FontColor', { Default = Library.FontColor });
Theme:AddButton('Default Theme', SetDefault);
Theme:AddToggle('Watermark', { Text = 'Show Watermark', Default = true }):OnChanged(function()
    Library:SetWatermarkVisibility(Toggles.Watermark.Value);
end);

task.spawn(function()
    while game:GetService('RunService').RenderStepped:Wait() do
        if Toggles.Rainbow.Value then
            local Registry = TestWindow.Holder.Visible and Library.Registry or Library.HudRegistry;

            for Idx, Object in next, Registry do
                for Property, ColorIdx in next, Object.Properties do
                    if ColorIdx == 'AccentColor' or ColorIdx == 'AccentColorDark' then
                        local Instance = Object.Instance;
                        local yPos = Instance.AbsolutePosition.Y;

                        local Mapped = Library:MapValue(yPos, 0, 1080, 0, 0.5) * 1.5;
                        local Color = Color3.fromHSV((Library.CurrentRainbowHue - Mapped) % 1, 0.8, 1);

                        if ColorIdx == 'AccentColorDark' then
                            Color = Library:GetDarkerColor(Color);
                        end;

                        Instance[Property] = Color;
                    end;
                end;
            end;
        end;
    end;
end);

Toggles.Rainbow:OnChanged(function()
    if not Toggles.Rainbow.Value then
        UpdateTheme();
    end;
end);

Options.BackgroundColor:OnChanged(UpdateTheme);
Options.MainColor:OnChanged(UpdateTheme);
Options.AccentColor:OnChanged(UpdateTheme);
Options.OutlineColor:OnChanged(UpdateTheme);
Options.FontColor:OnChanged(UpdateTheme);
Library:Notify('Loaded UI!');
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "swingKatana"
}

Toggles.Autoswing:OnChanged(function()
    if Toggles.Autoswing.Value then
        while Toggles.Autoswing.Value do
            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
            wait()
        end
    end
end)

Toggles.Autosell:OnChanged(function()
   if Toggles.Autosell.Value then
       while Toggles.Autosell.Value do
          plr.Character.HumanoidRootPart.CFrame = CFrame.new(83,91246,119)
          wait(0.25)
          plr.Character.HumanoidRootPart.CFrame = CFrame.new(11,4,-3)
          wait()
       end
   end
end)

Toggles.Speed:OnChanged(function()
   if Toggles.Speed.Value then
       print("MGU : SUPERSPEED")
       plr.Character.Humanoid.WalkSpeed = 90
       
       else
           plr.Character.Humanoid.WalkSpeed = 16
    end   
end)


Toggles.HighJump:OnChanged(function()
    if Toggles.HighJump.Value then
        print("MGU : HIGHJUMP")
        plr.Character.Humanoid.JumpPower = 350
        
    else
        plr.Character.Humanoid.JumpPower = 50 
    end
end)


UpdateTheme()
Library:Notify('Jarxay#0001 : youtube.com/c/jarxay');
