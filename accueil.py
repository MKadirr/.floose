import time

stri = "Bonjour maitre\n\nComment puis-je vous aider aujourd'hui ?"

def pri(c,u):
    if (ord(c[u]) < 33):
        if c[u] == ' ':
            time.sleep(2)
        print("\r", c, end="");
        return

    for i in range(33, ord(c[u]) + 1):
        time.sleep(0.01)
        print("\r", c[0:u]+chr(i), end="")
    print("\r", c, end="")
    return


def p(c):
    li = c.split("\n")
    for st in li:
        for i in range(1, len(st) + 1):
            pri(st[0:i], i-1)
            time.sleep(0.1)
        time.sleep(1)
        print()
p(stri)
