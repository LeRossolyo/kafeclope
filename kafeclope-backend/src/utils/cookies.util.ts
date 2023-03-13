import { Request } from "express";
import { IncomingHttpHeaders } from "http";

export abstract class JwtUtil {
    static extractJWT(req: Request): string | null {
        const token = JwtUtil.parseHeaders(req.headers);

        if (
            token &&
            token?.length > 0
        ) {
            return token;
        }
        return null;
    }

    private static parseHeaders(headers: IncomingHttpHeaders): string | undefined {
        if (headers === undefined) {
            return;
        }
        console.log(headers.authorization);
        const token = headers.authorization?.replace("Bearer ","");

        return token;
    }
}