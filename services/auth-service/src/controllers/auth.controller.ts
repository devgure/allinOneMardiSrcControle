// services/auth-service/src/controllers/auth.controller.ts
import { Request, Response } from 'express';
import { PrismaClient } from '@prisma/client';
import * as bcrypt from 'bcrypt';
import * as jwt from 'jsonwebtoken';

const prisma = new PrismaClient();
const JWT_SECRET = process.env.JWT_SECRET || 'secret';

export class AuthController {
  async register(req: Request, res: Response) {
    const { email, password, name, birthDate, gender, preferredGender } = req.body;

    const hashed = await bcrypt.hash(password, 10);
    try {
      const user = await prisma.user.create({
        data: {
          email,
          password: hashed,
          name,
          birthDate: new Date(birthDate),
          gender,
          preferredGender,
          preferences: { create: { showMe: preferredGender } },
        },
      });
      res.status(201).json({ id: user.id, email: user.email, name: user.name });
    } catch (err: any) {
      res.status(400).json({ error: err.message });
    }
  }

  async login(req: Request, res: Response) {
    const { email, password } = req.body;
    const user = await prisma.user.findUnique({ where: { email } });
    if (!user) return res.status(401).json({ error: 'Invalid credentials' });

    const valid = await bcrypt.compare(password, user.password);
    if (!valid) return res.status(401).json({ error: 'Invalid credentials' });

    const token = jwt.sign({ id: user.id, email: user.email }, JWT_SECRET, { expiresIn: '7d' });
    res.json({ token, user: { id: user.id, name: user.name, email: user.email } });
  }

  async verifyPhone(req: Request, res: Response) {
    // TODO: Integrate Twilio
    res.json({ success: true });
  }
}