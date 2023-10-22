import CryptoJS from 'crypto-js'

// 需要和后端一致
const KEY = CryptoJS.enc.Utf8.parse('1234567890172839');
const IV = CryptoJS.enc.Utf8.parse('1234567890172839');

/**
 * 加密
 * 若未指定密钥和偏移量则使用默认的
 * @param {*} info
 * @param {*} keyStr
 * @param {*} ivStr
 */
const encrypt = (info: any, keyStr?: any, ivStr?: any) => {
    let key = KEY;
    let iv = IV;

    if (keyStr) {
        key = CryptoJS.enc.Utf8.parse(keyStr);
        iv = CryptoJS.enc.Utf8.parse(ivStr);
    }
    let srcs = CryptoJS.enc.Utf8.parse(info);
    var encrypted = CryptoJS.AES.encrypt(srcs, key, {
        iv: iv,
        mode: CryptoJS.mode.CBC,
        padding: CryptoJS.pad.ZeroPadding
    });
    return CryptoJS.enc.Base64.stringify(encrypted.ciphertext);
}

/**
 * 解密
 * 若未指定密钥和偏移量则使用默认的
 * @param {*} info
 * @param {*} keyStr
 * @param {*} ivStr
 */
const decrypt = (info: any, keyStr?: any, ivStr?: any) => {
    let key = KEY;
    let iv = IV;

    if (keyStr) {
        key = CryptoJS.enc.Utf8.parse(keyStr);
        iv = CryptoJS.enc.Utf8.parse(ivStr);
    }

    let base64 = CryptoJS.enc.Base64.parse(info);
    let src = CryptoJS.enc.Base64.stringify(base64);

    let decrypt = CryptoJS.AES.decrypt(src, key, {
        iv: iv,
        mode: CryptoJS.mode.CBC,
        padding: CryptoJS.pad.ZeroPadding
    });

    let decryptedStr = decrypt.toString(CryptoJS.enc.Utf8);
    return decryptedStr.toString();
}

export default {
    encrypt,
    decrypt
}


