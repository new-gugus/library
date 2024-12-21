-- CustomGUI Library améliorée
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
    MainFrame.Size = UDim2.new(0, 400, 0, 600)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -300)
    MainFrame.BorderSizePixel = 0

    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Font = Enum.Font.GothamBold
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20
    Title.Text = title or "Custom GUI"

    return MainFrame
end

-- Fonction pour ajouter un onglet
function CustomGUI:AddTab(parent, tabName)
    local TabButton = Instance.new("TextButton")
    
    TabButton.Name = "TabButton"
    TabButton.Parent = parent
    TabButton.Size = UDim2.new(0, 100, 0, 30)
    TabButton.Text = tabName or "Tab"
    TabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Font = Enum.Font.Gotham
    TabButton.TextSize = 14

    return TabButton
end

-- Fonction pour ajouter une section
function CustomGUI:AddSection(parent, sectionTitle)
    local Section = Instance.new("Frame")
    local SectionTitle = Instance.new("TextLabel")

    Section.Name = "Section"
    Section.Parent = parent
    Section.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    Section.Size = UDim2.new(1, -20, 0, 50)
    Section.Position = UDim2.new(0, 10, 0, 60)
    Section.BorderSizePixel = 0

    SectionTitle.Name = "SectionTitle"
    SectionTitle.Parent = Section
    SectionTitle.Size = UDim2.new(1, 0, 0, 20)
    SectionTitle.Font = Enum.Font.Gotham
    SectionTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
    SectionTitle.TextSize = 14
    SectionTitle.Text = sectionTitle or "Section"
    SectionTitle.TextXAlignment = Enum.TextXAlignment.Left

    return Section
end

-- Fonction pour ajouter un bouton
function CustomGUI:AddButton(parent, buttonText, callback)
    local Button = Instance.new("TextButton")
    Button.Name = "Button"
    Button.Parent = parent
    Button.Size = UDim2.new(1, 0, 0, 30)
    Button.Text = buttonText or "Button"
    Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 14

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

    Toggle.Name = "Toggle"
    Toggle.Parent = parent
    Toggle.Size = UDim2.new(1, 0, 0, 30)
    Toggle.Text = toggleText or "Toggle"
    Toggle.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.Font = Enum.Font.Gotham
    Toggle.TextSize = 14

    Toggle.MouseButton1Click:Connect(function()
        State = not State
        Toggle.BackgroundColor3 = State and Color3.fromRGB(85, 85, 120) or Color3.fromRGB(55, 55, 65)
        if callback then
            callback(State)
        end
    end)

    return Toggle
end

-- Fonction pour ajouter une textbox
function CustomGUI:AddTextbox(parent, placeholderText, callback)
    local Textbox = Instance.new("TextBox")

    Textbox.Name = "Textbox"
    Textbox.Parent = parent
    Textbox.Size = UDim2.new(1, 0, 0, 30)
    Textbox.Text = ""
    Textbox.PlaceholderText = placeholderText or "Enter text"
    Textbox.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    Textbox.Font = Enum.Font.Gotham
    Textbox.TextSize = 14

    Textbox.FocusLost:Connect(function(enterPressed)
        if enterPressed and callback then
            callback(Textbox.Text)
        end
    end)

    return Textbox
end

-- Fonction pour ajouter un label
function CustomGUI:AddLabel(parent, labelText)
    local Label = Instance.new("TextLabel")

    Label.Name = "Label"
    Label.Parent = parent
    Label.Size = UDim2.new(1, 0, 0, 20)
    Label.Text = labelText or "Label"
    Label.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left

    return Label
end

-- Fonction pour ajouter un color picker (simplifié)
function CustomGUI:AddColorPicker(parent, callback)
    local ColorButton = Instance.new("TextButton")
    ColorButton.Name = "ColorButton"
    ColorButton.Parent = parent
    ColorButton.Size = UDim2.new(1, 0, 0, 30)
    ColorButton.Text = "Pick a Color"
    ColorButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ColorButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    ColorButton.Font = Enum.Font.Gotham
    ColorButton.TextSize = 14

    ColorButton.MouseButton1Click:Connect(function()
        -- Afficher un simple sélecteur de couleur (comportement à définir)
        if callback then
            callback(ColorButton.BackgroundColor3)
        end
    end)

    return ColorButton
end

-- Fonction pour ajouter une checkbox
function CustomGUI:AddCheckbox(parent, checkboxText, callback)
    local Checkbox = Instance.new("TextButton")
    local State = false

    Checkbox.Name = "Checkbox"
    Checkbox.Parent = parent
    Checkbox.Size = UDim2.new(1, 0, 0, 30)
    Checkbox.Text = checkboxText or "Checkbox"
    Checkbox.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    Checkbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    Checkbox.Font = Enum.Font.Gotham
    Checkbox.TextSize = 14

    Checkbox.MouseButton1Click:Connect(function()
        State = not State
        Checkbox.Text = State and "[X] " .. checkboxText or "[ ] " .. checkboxText
        if callback then
            callback(State)
        end
    end)

    return Checkbox
end

-- Fonction pour ajouter un paragraphe
function CustomGUI:AddParagraph(parent, paragraphText)
    local Paragraph = Instance.new("TextLabel")

    Paragraph.Name = "Paragraph"
    Paragraph.Parent = parent
    Paragraph.Size = UDim2.new(1, 0, 0, 60)
    Paragraph.Text = paragraphText or "This is a paragraph. Lorem ipsum dolor sit amet..."
    Paragraph.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    Paragraph.TextColor3 = Color3.fromRGB(255, 255, 255)
    Paragraph.Font = Enum.Font.Gotham
    Paragraph.TextSize = 14
    Paragraph.TextWrapped = true
    Paragraph.TextXAlignment = Enum.TextXAlignment.Left
    Paragraph.TextYAlignment = Enum.TextYAlignment.Top

    return Paragraph
end

-- Fonction pour ajouter un keybind
function CustomGUI:AddKeybind(parent, keyText, defaultKey, callback)
    local KeybindButton = Instance.new("TextButton")

    KeybindButton.Name = "KeybindButton"
    KeybindButton.Parent = parent
    KeybindButton.Size = UDim2.new(1, 0, 0, 30)
    KeybindButton.Text = keyText .. " [" .. defaultKey.Name .. "]"
    KeybindButton.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    KeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeybindButton.Font = Enum.Font.Gotham
    KeybindButton.TextSize = 14

    KeybindButton.MouseButton1Click:Connect(function()
        KeybindButton.Text = keyText .. " [Press a key...]"
        local inputConnection
        inputConnection = game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                KeybindButton.Text = keyText .. " [" .. input.KeyCode.Name .. "]"
                if callback then
                    callback(input.KeyCode)
                end
                inputConnection:Disconnect()
            end
        end)
    end)

    return KeybindButton
end

return CustomGUI
