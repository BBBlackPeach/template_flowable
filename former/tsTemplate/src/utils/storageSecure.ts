import sha256 from 'crypto-js/sha256'
import aes from 'crypto-js/aes'
import enc from 'crypto-js/enc-utf8'
import SecureStorage from 'secure-web-storage'
import CryptoJS from "crypto-js";

// const SECRET_KEY = 'beetledata'
//十六位十六进制数作为密钥
const SECRET_KEY = CryptoJS.enc.Utf8.parse('1234123412ABCDEF')
//十六位十六进制数作为密钥偏移量
const iv = CryptoJS.enc.Utf8.parse('ABCDEF1234123412');

const secureStorage = (storage) => new SecureStorage(storage, {
    hash: function hash(key) {
        key = sha256(key, SECRET_KEY)

        return key.toString()
    },
    encrypt: function encrypt(data) {
        data = aes.encrypt(data, SECRET_KEY, { iv: iv, mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7 })

        data = data.toString()

        return data
    },
    decrypt: function decrypt(data) {
        data = aes.decrypt(data, SECRET_KEY, { iv: iv, mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7 })

        data = data.toString(enc)

        return data
    }
})

export const secureSessionStorage = secureStorage(window.sessionStorage)
