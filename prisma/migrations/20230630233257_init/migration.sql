-- CreateTable
CREATE TABLE "Student" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "career" TEXT NOT NULL,
    "workshop_code" TEXT NOT NULL,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Workshop" (
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "calendar" TEXT NOT NULL,

    CONSTRAINT "Workshop_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "Cycle" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Cycle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Activity" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "workshop_code" TEXT NOT NULL,

    CONSTRAINT "Activity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Score" (
    "id" SERIAL NOT NULL,
    "student_id" INTEGER NOT NULL,
    "activity_id" INTEGER NOT NULL,
    "cycle_id" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "materials" INTEGER NOT NULL,
    "time" INTEGER NOT NULL,
    "drawing" INTEGER NOT NULL,
    "design" INTEGER NOT NULL,
    "present" BOOLEAN NOT NULL,

    CONSTRAINT "Score_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Workshop_code_key" ON "Workshop"("code");

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_workshop_code_fkey" FOREIGN KEY ("workshop_code") REFERENCES "Workshop"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Activity" ADD CONSTRAINT "Activity_workshop_code_fkey" FOREIGN KEY ("workshop_code") REFERENCES "Workshop"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Score" ADD CONSTRAINT "Score_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Score" ADD CONSTRAINT "Score_activity_id_fkey" FOREIGN KEY ("activity_id") REFERENCES "Activity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Score" ADD CONSTRAINT "Score_cycle_id_fkey" FOREIGN KEY ("cycle_id") REFERENCES "Cycle"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
