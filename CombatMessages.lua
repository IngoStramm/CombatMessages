-- Função para obter o idioma atual do cliente
local locale = GetLocale()

-- Definir as frases ameaçadoras para diferentes idiomas
local frases = {
    enUS = { -- Inglês (padrão)
        warlock = {"You challenge the shadows, %s? Prepare for torment!",
                   "I invoke the power of the shadows to destroy you, %s!", "Your end is near, %s, mortal!",
                   "I will take your soul, %s, and cast it into the abyss!", "You will never escape my grasp, %s!",
                   "The darkness consumes you, %s!", "I have seen your fate, %s, and it ends in suffering!",
                   "Embrace the void, %s, for it is your only escape!", "Your soul will burn in the pits of hell, %s!",
                   "You cannot hide from me, %s, the shadows always find you!"},
        mage = {"I summon the flames to burn you, %s!", "Feel the cold of my frost, %s, and tremble!",
                "Arcane power flows through me, %s, and you cannot escape it!",
                "Your fate is sealed by the arcane, %s!", "My fire will scorch your soul, %s!",
                "The winds of frost shall freeze your very being, %s!",
                "Feel the power of the arcane, %s, and know despair!",
                "The flames of destruction will consume you, %s!",
                "You cannot run from my magic, %s, it will find you!", "You will burn in the arcane fire, %s!"},
        paladin = {"By the Light, %s, you will be judged!", "You cannot escape the Light's judgment, %s!",
                   "I will smite you with the Light, %s!", "The Light will guide my hand to strike you down, %s!",
                   "You cannot stand against the Light, %s!", "My shield is unwavering, %s, and so is my will!",
                   "You will face justice, %s, by my hand!", "Feel the wrath of the Light, %s, it will purify you!",
                   "The Light will cleanse your soul, %s, whether you want it or not!",
                   "I bring the justice of the Light to you, %s!"},
        warrior = {"I will crush you with my blade, %s!", "Your bones will break under the weight of my fury, %s!",
                   "Prepare to face my wrath, %s!", "I fight for honor, %s, and I will make you fall!",
                   "You will feel the weight of my sword, %s!", "I am a warrior, %s, and you will not survive me!",
                   "I will break your will, %s, with my strength!", "You will fall to my blade, %s!",
                   "No one survives my fury, %s!", "You will be crushed by the might of my weapon, %s!"},
        rogue = {"I strike from the shadows, %s, and you will never see it coming!",
                 "Your end is swift and silent, %s!", "I will cut you before you even know I'm there, %s!",
                 "You can't escape my blade, %s, it cuts through the dark!",
                 "Your life will end in silence, %s, as my dagger finds its mark!",
                 "You cannot hide from me, %s, shadows are my ally!", "I will tear you apart, %s, and leave no trace!",
                 "You won't even know how it happened, %s, until it's too late!",
                 "Prepare to be stabbed, %s, for I am already behind you!",
                 "The shadows hide me, %s, but your blood will not!"},
        shaman = {"Feel the earth shake, %s, as I call upon its fury!",
                  "I call the storms, %s, and they will be your undoing!", "The elements will be your downfall, %s!",
                  "The lightning will strike you down, %s!", "I summon the winds to carry your soul away, %s!",
                  "By the earth and sky, %s, you will fall before me!",
                  "The elements are my allies, %s, and they will destroy you!",
                  "Feel the rage of the elements, %s, as they tear you apart!"},
        priest = {"Your mind will break, %s, as I control your thoughts!",
                  "I summon the Light to heal you, %s, but you will suffer!", "The shadows will consume your soul, %s!",
                  "I will purify you, %s, whether you like it or not!", "You can't escape the Light, %s!",
                  "Your sins will be cleansed, %s, by my holy power!", "Curse before the Light, %s, or face its wrath!",
                  "You will be purified, %s, or you will burn!"},
        druid = {"Nature will take you, %s, and you will be its prey!", "The fury of the wild is upon you, %s!",
                 "The forest's wrath will be your end, %s!", "I will shapeshift and crush you, %s!",
                 "The earth will swallow you whole, %s, and you'll be forgotten!",
                 "The moon guides my fury, %s, and it will not be merciful!",
                 "Feel the power of nature, %s, as it destroys you!",
                 "The jungle will reclaim you, %s, and you will be no more!"},
        hunter = {"The hunt begins, %s, and you are the prey!",
                  "You can't escape my arrows, %s, they always find their mark!", "My pet will tear you apart, %s!",
                  "You can't run from me, %s, my aim is true!", "Your life is mine, %s, and my aim will see it end!",
                  "You will fall into my trap, %s, and your fate will be sealed!",
                  "The beast within me will defeat you, %s!", "You are nothing but prey, %s, and I am the hunter!"}
    },
    ptBR = { -- Português
        warlock = {"Você desafia as trevas, %s? Prepare-se para o tormento!",
                   "Eu invoco o poder das sombras para destruir você, %s!", "Seu fim está próximo, %s, mortal!",
                   "Eu tomarei sua alma, %s, e a lançarei no abismo!", "Você nunca escapará do meu domínio, %s!",
                   "A escuridão te consome, %s!", "Eu vi seu destino, %s, e ele termina em sofrimento!",
                   "Abrace o vazio, %s, pois ele é sua única fuga!", "Sua alma queimará nos abismos do inferno, %s!",
                   "Você não pode se esconder de mim, %s, as sombras sempre te encontram!"},
        mage = {"Eu invoco as chamas para te queimar, %s!", "Sinta o frio do meu gelo, %s, e trema!",
                "O poder arcano flui através de mim, %s, e você não pode escapar dele!",
                "Seu destino está selado pelo arcano, %s!", "Meu fogo irá queimar sua alma, %s!",
                "Os ventos do gelo irão congelar sua essência, %s!",
                "Sinta o poder do arcano, %s, e saiba o que é a desesperança!",
                "As chamas da destruição irão te consumir, %s!",
                "Você não pode fugir da minha magia, %s, ela sempre te encontra!",
                "Você queimará no fogo arcano, %s!"},
        paladin = {"Pela Luz, %s, você será julgado!", "Você não pode escapar do julgamento da Luz, %s!",
                   "Eu vou te ferir com a Luz, %s!", "A Luz guiará minha mão para te derrotar, %s!",
                   "Você não pode resistir à Luz, %s!", "Meu escudo é inabalável, %s, e minha vontade também!",
                   "Você enfrentará a justiça, %s, pelas minhas mãos!",
                   "Sinta a ira da Luz, %s, ela irá te purificar!",
                   "A Luz purificará sua alma, %s, queira você ou não!", "Eu trago a justiça da Luz para você, %s!"},
        warrior = {"Eu vou te esmagar com minha lâmina, %s!",
                   "Suas ossos vão se quebrar sob o peso da minha fúria, %s!",
                   "Prepare-se para enfrentar minha ira, %s!", "Eu luto por honra, %s, e vou te fazer cair!",
                   "Você sentirá o peso da minha espada, %s!",
                   "Eu sou um guerreiro, %s, e você não sobreviverá a mim!",
                   "Eu vou quebrar sua vontade, %s, com minha força!", "Você cairá sob minha lâmina, %s!",
                   "Ninguém sobrevive à minha fúria, %s!", "Você será esmagado pelo poder da minha arma, %s!"},
        rogue = {"Eu ataco das sombras, %s, e você nunca saberá o que te atingiu!",
                 "Seu destino é rápido e silencioso, %s!",
                 "Eu vou te cortar antes de você perceber que estou aqui, %s!",
                 "Você não pode escapar da minha lâmina, %s, ela corta pela escuridão!",
                 "Sua vida vai acabar em silêncio, %s, quando minha adaga acertar!",
                 "Você não pode se esconder de mim, %s, as sombras são minhas aliadas!",
                 "Eu vou te rasgar, %s, e não deixar vestígios!",
                 "Você não vai nem saber como aconteceu, %s, até ser tarde!"},
        shaman = {"Sinta a terra tremer, %s, enquanto eu chamo sua fúria!",
                  "Eu invoco as tempestades, %s, e elas irão te destruir!", "Os elementos serão sua ruína, %s!",
                  "O relâmpago irá te destruir, %s!", "Eu invoco os ventos para carregar sua alma, %s!",
                  "Pela terra e pelo céu, %s, eu vou te derrotar!",
                  "Os elementos estão comigo, %s, e eles são impiedosos!",
                  "Sinta a raiva dos elementos, %s, enquanto eles te destroem!"},
        priest = {"Sua mente vai se quebrar, %s, enquanto eu controlo seus pensamentos!",
                  "Eu invoco a Luz para te curar, %s, mas será você quem sofrerá!",
                  "As sombras irão consumir sua alma, %s!", "Eu vou te purificar, %s, quer você queira ou não!",
                  "Você não pode fugir da Luz, %s!", "Seus pecados serão purificados, %s, pelo meu poder sagrado!",
                  "Curse diante da Luz, %s, ou enfrente sua ira!", "Você será purificado, %s, ou você queimará!"},
        druid = {"A natureza irá te tomar, %s, e você não resistirá!",
                 "Eu chamo a fúria da selva, %s, e você sentirá sua ira!",
                 "A fúria da floresta está sobre você, %s!", "Eu vou me transformar e te esmagar, %s!",
                 "A terra irá te engolir, %s, e você se tornará nada!",
                 "A lua guia minha fúria, %s, e ela irá te derrotar!",
                 "Sinta o poder da natureza, %s, e prepare-se para seu fim!",
                 "A selva vai te reclamar, %s, e você não será mais nada!"},
        hunter = {"A caça começa, %s, e você é a presa!",
                  "Você não pode escapar das minhas flechas, %s, elas sempre encontram o alvo!",
                  "Meu pet vai te rasgar, %s!", "Você não pode correr de mim, %s, minha mira é certeira!",
                  "Sua vida é minha, %s, e minha mira vai acabar com ela!",
                  "Você cairá na minha armadilha, %s, e seu destino será selado!",
                  "A fera dentro de mim vai te derrotar, %s!", "Você é nada mais que presa, %s, e eu sou o caçador!"}
    }
}

-- Traduções para a palavra "diz" (emote) conforme o idioma
local emoteTranslations = {
    enUS = "says", -- Inglês
    ptBR = "diz" -- Português
}

-- Variável de controle para ativar/desativar o debug
local debugMode = false -- Defina como 'true' para ativar o debug, 'false' para desativar

-- Função para verificar se o jogador é uma classe válida
local function isClassValid(className)
    local validClasses = {
        WARLOCK = true,
        MAGE = true,
        PALADIN = true,
        WARRIOR = true,
        ROGUE = true,
        SHAMAN = true,
        PRIEST = true,
        DRUID = true,
        HUNTER = true
    }

    return validClasses[className] or false
end

-- Função para verificar se o jogador é da classe Warlock, Mage, etc.
local function isPlayerClass(className)
    local _, playerClass = UnitClass("player") -- Obtém a classe do jogador
    if debugMode then
        -- Exibe a classe do jogador no chat se o debug estiver ativado
        print("Classe do jogador: " .. playerClass)
    end
    return playerClass == className
end

-- Função para enviar a frase personalizada como emote
local function enviar_frase_com_emote()
    -- Verifica se o jogador tem uma classe válida
    local _, playerClass = UnitClass("player")
    if not isClassValid(playerClass) then
        return -- Se a classe não for válida, não faz nada
    end

    -- Verifica se há um alvo
    local alvo = UnitName("target")
    if not alvo then
        return -- Se não houver alvo, não faz nada
    end

    -- Seleciona as frases para o idioma correto, ou usa inglês por padrão
    local frases_do_idioma = frases[locale][playerClass:lower()] or frases.enUS.warlock -- Se o idioma não estiver disponível, usa inglês
    local emote_translation = emoteTranslations[locale] or emoteTranslations.enUS -- Traduz o "diz", usa inglês se não tiver tradução

    -- Escolhe uma frase aleatória e substitui %s pelo nome do alvo
    local frase = string.format(frases_do_idioma[math.random(1, #frases_do_idioma)], alvo)

    -- Envia a frase como um emote
    local emote_com_frase = emote_translation .. ": " .. frase
    SendChatMessage(emote_com_frase, "EMOTE")
end

-- Função para verificar se o alvo é atacável
local function verificarAlvoAtacavel()
    -- Verifica se há um alvo selecionado
    if UnitExists("target") then
        -- Verifica se o alvo não está morto e pode ser atacado
        if not UnitIsDead("target") and UnitCanAttack("player", "target") then
            -- Verifica se o alvo não está sendo agarrado por outro jogador (tapped)
            if not UnitIsTapDenied("target") then
                -- Verifica se o alvo é inimigo
                if not UnitIsFriend("player", "target") then
                    return true -- O alvo é atacável
                else
                    -- print("O alvo não é inimigo.")
                    return false
                end
            else
                -- print("O alvo está sendo atacado por outro jogador.")
                return false
            end
        else
            -- print("O alvo não é atacável (morto ou não pode ser atacado).")
            return false
        end
    else
        -- print("Nenhum alvo selecionado.")
        return false
    end
end

-- Evento para detectar quando o jogador entra em combate
local function onEvent(self, event, arg1)
    if event == "PLAYER_REGEN_DISABLED" then
        -- Quando o jogador entra em combate, envia a frase como emote
        if verificarAlvoAtacavel() then
            enviar_frase_com_emote()
        end
    end
end

-- Cria o frame para escutar os eventos
local frame = CreateFrame("Frame")

-- Registra os eventos para quando o jogador entra ou sai de combate
frame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Evento para quando entra em combate
frame:RegisterEvent("PLAYER_REGEN_ENABLED") -- Evento para quando sai de combate

-- Configura a função que será chamada quando o evento ocorrer
frame:SetScript("OnEvent", onEvent)
