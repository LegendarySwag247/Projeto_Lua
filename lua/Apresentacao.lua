local quantidade = 0
local identidade = 0
local cadastros = {}
local bicicletas = {}

for i = 1,10,1 do
    bicicletas[i] = 'd'
end

function devolver(id)
    local erro = ""
    for i,pessoa in ipairs(cadastros)do
        if id == pessoa.id then
            bicicletas[pessoa.fa] = 'd'
            pessoa.fa = 'nada'
            print("Sua bicicleta foi devolvida!")
            erro = ""
            break
        else
            erro = "id nao identificado"
        end
    end
    print(erro)
end

function ecolha_bicicleta(id)
    local erro
    for i,pessoa in ipairs(cadastros)do
        if id == pessoa.id and pessoa.fa == 'nada' then
            print("---Escolha um numero dessas bicicletas para alugar---")
            print("d - disponivel;\na - alugado;")
            for i in ipairs(bicicletas) do
                print("Bicicleta "..i..": "..bicicletas[i])
            end
            print("----------------------------------------------")
            escolha_b = io.read()
            escolha_b = tonumber(escolha_b)
            if bicicletas[escolha_b] == 'd' then
                bicicletas[escolha_b] = 'a'
                pessoa.fa = escolha_b
                print("A bicicleta "..escolha_b.." foi escolhido")
            elseif bicicletas[escolha_b] == 'a' then
                print("Essa bicicleta foi alugado.")
            else
                print("Valor nao existe tente novamente.")
            end
        elseif pessoa.fa ~= 'nada'then
            erro = "Ja possui uma bicicleta alugada."
        elseif id ~= pessoa.id then
            erro = "id nao identificado"
        end
    end
end

function dados()
    for i,pessoa in ipairs(cadastros) do 
        print("\n--- Usuario "..i.." ---")
        print("Nome: "..pessoa.no)
        print("Idade: "..pessoa.ida)
        print("E-mail: "..pessoa.em)
        print("id: "..pessoa.id)
        print("Numero da bicicleta alugada: "..pessoa.fa)
        print("-----------------")
    end
end

function pesquisar_dados(nome)
    for i,pessoa in ipairs(cadastros) do 
        if nome == pessoa.no then
            print("\n--- Usuario "..i.." ---")
            print("Nome: "..pessoa.no)
            print("Idade: "..pessoa.ida)
            print("E-mail: "..pessoa.em)
            print("id: "..pessoa.id)
            print("Numero da bicicleta alugada: "..pessoa.fa)
            print("-----------------")
        end
    end
end

function Cadastrar(nome, idade, email, identidade, foi_alugado)
    local pessoa = {no = nome, ida = idade, em = email, id = identidade, fa = foi_alugado}
    table.insert(cadastros, pessoa)

    dados()

end

local function escolha(opcao)
    os.execute("cls")
    local case = {1,2,3,4,5}
    if opcao == case[1] then
        local nome, idade, email
        local foi_alugado = 'nada'
        print("Digite seu nome: ")
        nome = io.read()
        print("Digite sua idade: ")
        idade = io.read()
        idade = tonumber(idade)
        print("Digite seu e-mail: ")
        email = io.read()
        quantidade = quantidade + 1
        identidade = identidade + 1
        Cadastrar(nome, idade, email, identidade, foi_alugado)
    elseif opcao == case[2] then
        local nome
        print("Digite o nome do usuario: ")
        nome = io.read()
        
        pesquisar_dados(nome)

    elseif opcao == case[3] then
        local id
        print("Digite o id do usuario: ")
        id = io.read()
        id = tonumber(id)
        
        ecolha_bicicleta(id)
        
    elseif opcao == case[4] then
        local id
        local escolha_b
        print("Digite o id do usuario: ")
        id = io.read()
        id = tonumber(id)

        devolver(id)

    elseif opcao == case[5] then
        print("Saindo, obrigado por utilizar nosso sistema!")
    else 
        print("Opcao invalida, tente novamente!!")
    end

end

function Start()
    local opcao = 1
    while opcao ~= 5 do
        print("------- Bem vindo ao aluguel de bicicleta eletrica -------")
        print("Digite:\n")
        print("1 - Cadastrar")
        print("2 - Buscar usuario")
        print("3 - Alugar")
        print("4 - Devolver")
        print("5 - Sair")
        print("----------------------------------------------------------")
        opcao = io.read()
        opcao = tonumber(opcao)
        escolha(opcao)
    
    end

end

Start()