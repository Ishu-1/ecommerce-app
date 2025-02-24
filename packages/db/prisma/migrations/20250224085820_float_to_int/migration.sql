/*
  Warnings:

  - The `products` column on the `Orders` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to alter the column `amount` on the `Orders` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `Integer`.
  - The `paymentMode` column on the `Orders` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `image` column on the `Product` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to alter the column `price` on the `Product` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `Integer`.
  - The `cart` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Orders" DROP COLUMN "products",
ADD COLUMN     "products" JSONB[],
ALTER COLUMN "amount" SET DATA TYPE INTEGER,
DROP COLUMN "paymentMode",
ADD COLUMN     "paymentMode" TEXT NOT NULL DEFAULT 'COD';

-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "category" TEXT,
DROP COLUMN "image",
ADD COLUMN     "image" TEXT[],
ALTER COLUMN "price" SET DATA TYPE INTEGER;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "wishlist" TEXT[],
DROP COLUMN "cart",
ADD COLUMN     "cart" JSONB[];

-- DropEnum
DROP TYPE "PaymentMode";
