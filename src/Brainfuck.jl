
# input::String = readline()

input::String = "++++++++>+++."
# input::String = ""

function interpret(input::String)
    memory = zeros(UInt8,5)
    instPtr::Int = 1
    dataPtr::Int = 1
    while instPtr < length(memory)
        command = memory[instPtr]
        if command == '>'
           dataPtr += 1
           if dataPtr == length(memory) + 1
                dataPtr = 1
           end
        end

        if command == '<'
           dataPtr -= 1
           if dataPtr == 0
                dataPtr = length(memory)
           end
        end

        if command == '+'
            memory[dataPtr] += 1
        end

        if command == '-'
            memory[dataPtr] -= 1
        end

        if command == '.'
            print(Char(memory[dataPtr]))
        end

        if command == '['
            if memory[dataPtr] == 0
                while memory[dataPtr] != ']'
                    instPtr += 1
                end
                instPtr += 1
            end
        end

        if command == ']'
            if memory[dataPtr] != 0
                while memory[dataPtr] != '['
                    instPtr -= 1
                end
                instPtr -= 1
            end
        end
        instPtr += 1

    end
    print(memory)
end

interpret(input)