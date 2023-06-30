import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  await prisma.workshop.upsert({
    where: { code: 'TEST2023' },
    update: {},
    create: {
      code: 'TEST2023',
      name: 'Test Workshop',
      calendar: 'Semestral',
      Activity: {
        create: {
          name: 'Sombras',
          value: 15,
        },
      },
    },
  });

  const cycles = ['Primer parcial', 'Segundo Parcial', 'Tercer Parcial'];
  for (const [index, cycle] of cycles.entries()) {
    await prisma.cycle.upsert({
      where: { id: index + 1 },
      update: {},
      create: {
        name: cycle,
      },
    });
  }
}
main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
