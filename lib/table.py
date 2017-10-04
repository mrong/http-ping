class Table:
    def __init__(self, columns, column_separator):
        self.columns = columns
        self.column_separator = column_separator

    def format_row(self, values):
        cells = []

        for key, length, align in self.columns:
            if key in values:
                value = str(values[key])
            else:
                value = ""

            if align == "right":
                value = value.rjust(length)
            else:
                value = value.ljust(length)

            cells.append(value)

        return self.column_separator.join(cells)

    def print_row(self, values):
        string = self.format_row(values)

        print(string.rstrip())

        return len(string)
