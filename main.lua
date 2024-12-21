-- CustomGUI Library
local CustomGUI = {}

-- Fonction pour créer une fenêtre principale
function CustomGUI:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")

    -- Propriétés de la fenêtre principale
    ScreenGui.Name = "CustomGUI"
    ScreenGui.Parent = game:GetService("CoreGui")

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    MainFrame.Size = UDim2.new(0, 400, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    MainFrame.BorderSizePixel = 0

    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Font = Enum.Font.GothamBold
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20
    Title.Text = title or "Custom GUI"

    -- Retourne la fenêtre pour ajouter des éléments
    return MainFrame
end

-- Fonction pour ajouter une section
function CustomGUI:AddSection(parent, sectionTitle)
    local Section = Instance.new("Frame")
    local SectionTitle = Instance.new("TextLabel")

    -- Propriétés de la section
    Section.Name = "Section"
    Section.Parent = parent
    Section.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    Section.Size = UDim2.new(1, -20, 0, 50)
    Section.Position = UDim2.new(0, 10, 0, 60)
    Section.BorderSizePixel = 0

    SectionTitle.Name = "SectionTitle"
    SectionTitle.Parent = Section
    SectionTitle.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    SectionTitle.Size = UDim2.new(1, 0, 0, 20)
    SectionTitle.Font = Enum.Font.Gotham
    SectionTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
    SectionTitle.TextSize = 14
    SectionTitle.Text = sectionTitle or "Section Title"
    SectionTitle.TextXAlignment = Enum.TextXAlignment.Left

    return Section
end

-- Fonction pour ajouter un bouton
function CustomGUI:AddButton(parent, buttonText, callback)
    local Button = Instance.new("TextButton")

    -- Propriétés du bouton
    Button.Name = "Button"
    Button.Parent = parent
    Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    Button.Size = UDim2.new(1, 0, 0, 30)
    Button.Font = Enum.Font.Gotham
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.Text = buttonText or "Button"

    Button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    return Button
end

-- Fonction pour ajouter un toggle (interrupteur)
function CustomGUI:AddToggle(parent, toggleText, callback)
    local Toggle = Instance.new("TextButton")
    local State = false

    -- Propriétés du toggle
    Toggle.Name = "Toggle"
    Toggle.Parent = parent
    Toggle.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    Toggle.Size = UDim2.new(1, 0, 0, 30)
    Toggle.Font = Enum.Font.Gotham
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.TextSize = 14
    Toggle.Text = toggleText or "Toggle"

    Toggle.MouseButton1Click:Connect(function()
        State = not State
        Toggle.BackgroundColor3 = State and Color3.fromRGB(85, 85, 120) or Color3.fromRGB(55, 55, 65)
        if callback then
            callback(State)
        end
    end)

    return Toggle
end

-- Fonction pour ajouter un slider
function CustomGUI:AddSlider(parent, sliderText, min, max, callback)
    local SliderFrame = Instance.new("Frame")
    local SliderText = Instance.new("TextLabel")
    local Slider = Instance.new("TextButton")
    local Value = min

    -- Propriétés du slider
    SliderFrame.Name = "SliderFrame"
    SliderFrame.Parent = parent
    SliderFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    SliderFrame.Size = UDim2.new(1, 0, 0, 50)

    SliderText.Name = "SliderText"
    SliderText.Parent = SliderFrame
    SliderText.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    SliderText.Size = UDim2.new(1, 0, 0, 20)
    SliderText.Font = Enum.Font.Gotham
    SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderText.TextSize = 14
    SliderText.Text = sliderText or "Slider"
    SliderText.TextXAlignment = Enum.TextXAlignment.Left

    Slider.Name = "Slider"
    Slider.Parent = SliderFrame
    Slider.BackgroundColor3 = Color3.fromRGB(85, 85, 120)
    Slider.Size = UDim2.new(0, 100, 0, 20)
    Slider.Position = UDim2.new(0, 0, 0, 30)

    Slider.MouseButton1Click:Connect(function()
        Value = math.clamp(Value + 1, min, max)
        Slider.Size = UDim2.new(0, Value * 10, 0, 20)
        if callback then
            callback(Value)
        end
    end)

    return SliderFrame
end

return CustomGUI
