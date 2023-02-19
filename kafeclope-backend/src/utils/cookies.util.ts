import { Request } from "express";

export class CookiesUtil {
    static parseCookies(cookies: string | undefined): {[Key: string]: string} {
        if (cookies === undefined) {
            return {};
        }

        const rawCookies = cookies.split('; ');
        const result: {[Key: string]: string} = {};
        rawCookies.forEach((rawCookie: string) => {
            const [key, value] = rawCookie.split('=');
            result[key] = value;
        });

        return result;
    }

    static extractCookie(req: Request, name: string): string | null {
        const cookies = this.parseCookies(req.headers.cookie);

        if (
            cookies &&
            name in cookies &&
            cookies[name].length > 0
        ) {
            return cookies[name];
        }
        return null;
    }
}