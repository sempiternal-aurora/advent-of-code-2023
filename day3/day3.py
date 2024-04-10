from enum import Enum

class Symbol(Enum):
    PERIOD = 1
    SYMBOL = 2
    NUMBER = 3

class CheckedInteger:
    def __init__(self, num, is_checked):
        self.num = num
        self.is_checked = is_checked
    
    def __str__(self):
        return f"{self.num} {self.is_checked}"
    
    def __repr__(self):
        return f"CheckedInteger({self.num}, {self.is_checked})"



def parse_schematic(schematic):
    new_schematic = []
    for line in schematic:
        parsed_line = []
        line = line.rstrip()
        i = 0
        while i < len(line):
            if (line[i].isnumeric()):
                num = CheckedInteger(int(line[i]), False)
                parsed_line.append((Symbol.NUMBER, num))
                i += 1
                if (i >= len(line)): break
                while line[i].isnumeric():
                    num.num *= 10
                    num.num += int(line[i])
                    parsed_line.append((Symbol.NUMBER, num))
                    i += 1
                    if i >= len(line): break
            elif line[i] != '.':
                parsed_line.append((Symbol.SYMBOL, line[i]))
                i += 1
            else:
                parsed_line.append((Symbol.PERIOD, '.'))
                i += 1
        new_schematic.append(parsed_line)
    return new_schematic

if __name__ == '__main__':
    with open("input", 'r') as f:
        schematic = f.readlines()
    new_schematic = parse_schematic(schematic)
    sum = 0
    for y in range(0, len(new_schematic)):
        for x in range(0, len(new_schematic[y])):
            if new_schematic[y][x][0] == Symbol.SYMBOL and new_schematic[y][x][1] == '*':
                num_numbers = 0
                ratio = 1
                for y1 in range(max(0, y-1), min(y+2, len(new_schematic))):
                    for x1 in range(max(0, x-1), min(x+2, len(new_schematic[y1]))):
                        if new_schematic[y1][x1][0] == Symbol.NUMBER and not new_schematic[y1][x1][1].is_checked:
                            ratio *= new_schematic[y1][x1][1].num
                            new_schematic[y1][x1][1].is_checked = True
                            num_numbers += 1
                if num_numbers == 2:
                    sum += ratio
                for y1 in range(max(0, y-1), min(y+2, len(new_schematic))):
                    for x1 in range(max(0, x-1), min(x+2, len(new_schematic[y1]))):
                        if new_schematic[y1][x1][0] == Symbol.NUMBER:
                            new_schematic[y1][x1][1].is_checked == False
    print(sum)
