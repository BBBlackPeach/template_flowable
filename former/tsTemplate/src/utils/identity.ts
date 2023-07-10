export const getUserSex = (identity: any) => {
    if (identity.length != 15 && identity.length != 18) {
        return
    }
    let sexFlag = null;
    if (identity.length == 15) {
        // 倒数第一位是性别识别码
        sexFlag = Number(identity.substring(14));
        console.log(sexFlag);
        if (sexFlag % 2 == 0) {
            return "女"
        } else {
            return "男"
        }
    } else if (identity.length == 18) {
        // 倒数第二位是性别识别码
        sexFlag = Number(identity.substring(16));
        console.log(sexFlag);
        if (sexFlag % 2 == 0) {
            return "女"
        } else {
            return "男"
        }
    }
}

export const getUserBirthday = (identity: any) => {
    if (identity.length != 15 && identity.length != 18) {
        return
    }
    let year = null;
    let month = null;
    let day = null;
    let birthday = null;
    if (identity.length == 15) {
        year = identity.substring(6, 8);
        // if (Number(year) >= new Date().getFullYear()) {
        //     return
        // }
        month = identity.substring(8, 10);
        day = identity.substring(10, 12);
        birthday = "19" + year + "-" + month + "-" + day;
        console.log(birthday);
        return birthday;
    } else if (identity.length == 18) {
        year = identity.substring(6, 10);
        month = identity.substring(10, 12);
        day = identity.substring(12, 14);
        birthday = year + "-" + month + "-" + day;
        console.log(birthday);
        return birthday;
    }
}