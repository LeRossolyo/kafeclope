import { Injectable, NestMiddleware, Logger } from '@nestjs/common';
import { Request, Response, NextFunction } from 'express';

@Injectable()
export class AppLoggerMiddleware implements NestMiddleware {
    private logger = new Logger('HTTP');

    use(request: Request, response: Response, next: NextFunction): void {
        const { ip, method, originalUrl } = request;
        const userAgent = request.get('user-agent') || '';

        response.on('close', () => {
            const { statusCode } = response;
            const contentLength = response.get('content-length');

            if (statusCode == 200) {
                this.logger.log(
                    `🥑\u001b[32m ${method} ${originalUrl} ${statusCode} \x1b[0m: ${contentLength} - ${userAgent} ${ip}`
                );
            } else {
                this.logger.log(
                    `🍅\u001b[31m ${method} ${originalUrl} ${statusCode} \x1b[0m: ${contentLength} - ${userAgent} ${ip}`
                );
            }
        });
        next();
    }
}