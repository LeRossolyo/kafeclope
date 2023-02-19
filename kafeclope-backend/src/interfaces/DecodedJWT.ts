export interface DecodedJWT {
  sub: number;
  iat: number;
  exp: number;
  iss: string;
}