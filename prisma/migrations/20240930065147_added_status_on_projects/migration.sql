/*
  Warnings:

  - Added the required column `updatedAt` to the `Projects` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Projects" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "status" "Status" NOT NULL DEFAULT 'Enabled',
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;
