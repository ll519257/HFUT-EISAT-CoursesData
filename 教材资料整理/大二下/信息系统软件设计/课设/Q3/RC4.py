import base64


def rc4(text: str, key: str) -> str:
    S = []
    T = []
    for i in range(256):
        S.append(i)
        T.append(key[i % len(key)])
    j = 0
    for i in range(256):
        j = (j + S[i] + ord(T[i])) % 256
        # print(i,j)
        S[i], S[j] = S[j], S[i]
    i = 0
    j = 0
    res = ""
    for r in range(len(text)):
        i = (j + 1) % 256
        j = (j + S[i]) % 256
        S[i], S[j] = S[j], S[i]
        k = chr(ord(text[r]) ^ S[(S[i] + S[j]) % 256])
        res += k
    return res


def rc4Entry(words: str, key: str) -> str:
    return rc4(base64.b64encode(words.encode()).decode(), base64.b64encode(key.encode()).decode())


def rc4Detry(words: str, key: str) -> str:
    return base64.b64decode(rc4(words, base64.b64encode(key.encode()).decode())).decode()


if __name__ == "__main__":

    # res = base64.b64encode(st)
    # print(res)  # 默认以utf8解码
    # res = base64.b64decode(res)
    # print(res.decode())#默认以utf8解码
    a = rc4Entry("LZXD", "RRK")
    print(a)
    print(rc4Detry(a, "ZXD"))
