-- Add missing variant inventory levels
INSERT INTO inventory_levels (
    id,
    productId,
    variantId,
    wholesaleQty,
    retailQty,
    shelfQty,
    wholesaleUnit,
    retailUnit,
    shelfUnit,
    pcsPerPack,
    packsPerBox,
    shelfRestockLevel
)
VALUES
    ('inv-kopiko-single', 'prd-kopiko-brown', 'var-kopiko-brown-1', 15, 40, 25, 'box', 'pack', 'pack', 1, 24, 15),
    ('inv-kopiko-twin', 'prd-kopiko-brown', 'var-kopiko-brown-2', 10, 25, 15, 'box', 'pack', 'pack', 1, 12, 10),
    ('inv-luckymepc-orig', 'prd-luckymepc-chilimansi', 'var-luckymepc-1', 18, 42, 28, 'box', 'pack', 'pack', 1, 24, 15),
    ('inv-luckymepc-xtra', 'prd-luckymepc-chilimansi', 'var-luckymepc-2', 12, 24, 12, 'box', 'pack', 'pack', 1, 24, 10),
    ('inv-century-reg', 'prd-century-tuna-hotspicy', 'var-century-tuna-1', 12, 24, 16, 'case', 'can', 'pack', 1, 12, 8),
    ('inv-century-fam', 'prd-century-tuna-hotspicy', 'var-century-tuna-2', 6, 12, 6, 'case', 'can', 'pack', 1, 6, 4),
    ('inv-datuputi-1l', 'prd-datupoti-soysauce', 'var-datu-puti-1', 8, 18, 10, 'case', 'bottle', 'pack', 1, 12, 6),
    ('inv-datuputi-500ml', 'prd-datupoti-soysauce', 'var-datu-puti-2', 10, 22, 12, 'case', 'bottle', 'pack', 1, 12, 8)
ON DUPLICATE KEY UPDATE
    wholesaleQty = VALUES(wholesaleQty),
    retailQty = VALUES(retailQty),
    shelfQty = VALUES(shelfQty),
    wholesaleUnit = VALUES(wholesaleUnit),
    retailUnit = VALUES(retailUnit),
    shelfUnit = VALUES(shelfUnit),
    pcsPerPack = VALUES(pcsPerPack),
    packsPerBox = VALUES(packsPerBox),
    shelfRestockLevel = VALUES(shelfRestockLevel);

-- Add missing variant batches
INSERT INTO product_batches (
    id,
    productId,
    variantId,
    batchNumber,
    expirationDate,
    manufacturingDate,
    receivedDate,
    wholesaleQty,
    retailQty,
    shelfQty,
    initialQty,
    costPrice,
    supplierId,
    invoiceNumber,
    status,
    notes
)
VALUES
    ('bat-kopiko-single-001', 'prd-kopiko-brown', 'var-kopiko-brown-1', 'KOPIKO-SINGLE-2026-001', '2027-02-28', '2026-03-15', '2026-04-08', 15, 40, 25, 80, 13.50, 'sup-pantry-direct', 'VAR-003', 'active', 'Variant batch for single sachet Kopiko'),
    ('bat-kopiko-twin-001', 'prd-kopiko-brown', 'var-kopiko-brown-2', 'KOPIKO-TWIN-2026-001', '2027-02-28', '2026-03-15', '2026-04-08', 10, 25, 15, 50, 27.00, 'sup-pantry-direct', 'VAR-004', 'active', 'Variant batch for twin pack Kopiko'),
    ('bat-luckymepc-orig-001', 'prd-luckymepc-chilimansi', 'var-luckymepc-1', 'PC-ORIG-2026-001', '2027-03-15', '2026-03-20', '2026-04-08', 18, 42, 28, 88, 13.00, 'sup-pinoy-grocery', 'VAR-005', 'active', 'Variant batch for original Lucky Me PC'),
    ('bat-luckymepc-xtra-001', 'prd-luckymepc-chilimansi', 'var-luckymepc-2', 'PC-XTRA-2026-001', '2027-03-15', '2026-03-20', '2026-04-08', 12, 24, 12, 48, 14.50, 'sup-pinoy-grocery', 'VAR-006', 'active', 'Variant batch for extra chilimansi Lucky Me PC'),
    ('bat-century-reg-001', 'prd-century-tuna-hotspicy', 'var-century-tuna-1', 'TUNA-REG-2026-001', '2027-04-30', '2026-03-12', '2026-04-08', 12, 24, 16, 52, 34.00, 'sup-pinoy-grocery', 'VAR-007', 'active', 'Variant batch for regular Century Tuna'),
    ('bat-century-fam-001', 'prd-century-tuna-hotspicy', 'var-century-tuna-2', 'TUNA-FAM-2026-001', '2027-04-30', '2026-03-12', '2026-04-08', 6, 12, 6, 24, 52.00, 'sup-pinoy-grocery', 'VAR-008', 'active', 'Variant batch for family size Century Tuna'),
    ('bat-datuputi-1l-001', 'prd-datupoti-soysauce', 'var-datu-puti-1', 'SOY-1L-2026-001', '2027-06-30', '2026-03-05', '2026-04-08', 8, 18, 10, 36, 42.00, 'sup-pantry-direct', 'VAR-009', 'active', 'Variant batch for 1L Datu Puti soy sauce'),
    ('bat-datuputi-500ml-001', 'prd-datupoti-soysauce', 'var-datu-puti-2', 'SOY-500ML-2026-001', '2027-06-30', '2026-03-05', '2026-04-08', 10, 22, 12, 44, 30.00, 'sup-pantry-direct', 'VAR-010', 'active', 'Variant batch for 500ml Datu Puti soy sauce')
ON DUPLICATE KEY UPDATE
    batchNumber = VALUES(batchNumber),
    expirationDate = VALUES(expirationDate),
    manufacturingDate = VALUES(manufacturingDate),
    receivedDate = VALUES(receivedDate),
    wholesaleQty = VALUES(wholesaleQty),
    retailQty = VALUES(retailQty),
    shelfQty = VALUES(shelfQty),
    initialQty = VALUES(initialQty),
    costPrice = VALUES(costPrice),
    supplierId = VALUES(supplierId),
    invoiceNumber = VALUES(invoiceNumber),
    status = VALUES(status),
    notes = VALUES(notes);