import jwt = require("jsonwebtoken");

export const verifyToken = (token: string) => {
    return jwt.verify(token, process.env.JWT_SECRET_KEY as string);
}

export const extractPayload = (token: string) => {
    const payload = verifyToken(token);
    return payload;
};