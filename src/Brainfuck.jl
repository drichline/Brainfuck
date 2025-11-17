
# input::String = readline()

input::String = "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++."
# input::String = ""

function interpret(input::String)
    memory = zeros(UInt8,65535)
    pointer::Int = 1
    index::Int = 
    for character in input
        if character == '>'
           pointer += 1
           if pointer == length(memory) + 1
                pointer = 1
           end
        end

        if character == '<'
           pointer -= 1
           if pointer == 0
                pointer = length(memory)
           end
        end

        if character == '+'
            memory[pointer] += 1
        end

        if character == '-'
            memory[pointer] -= 1
        end

        if character == '.'
            print(Char(memory[pointer]))
        end

        if character == '['
            if memory[pointer] == 0
                while memory[pointer] != ']'
                    pointer += 1
                end
                pointer += 1
            end
        end

        if character == ']'
            if memory[pointer] != 0
                while memory[pointer] != '['
                    pointer -= 1
                end
                pointer -= 1
            end
        end
    end
    print(memory)
end

interpret(input)