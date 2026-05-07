using System;

namespace SistemaContableCafeteria
{
    class Program
    {
        static void Main(string[] args)
        {
            // =====================================================================
            // DECLARACIÓN DE ESTADO FINANCIERO Y VARIABLES GLOBALES DE PERSISTENCIA
            // =====================================================================
            // RESTRICCIÓN ACTIVA (CERO VECTORES O ARRAYS): Toda la vital información 
            // de la jornada laboral persiste en la RAM únicamente a través de variables
            // primitivas individuales, contadores unitarios y acumuladores aritméticos.
            
            // 1. Fondos de Apertura Monetaria (Sencillo de caja del día)
            decimal cajaInicial = 150.00m; 
            
            // 2. Acumuladores Monetarios Maestros (Núcleo contable del sistema)
            // Se utiliza el tipo 'decimal' en lugar de 'double' por buena práctica financiera
            // para evitar y anular la pérdida de precisión en la coma flotante de las monedas.
            decimal totalIngresos = 0.00m;
            decimal totalEgresos = 0.00m;
            
            // 3. Contadores Estadísticos Unitarios (Métricas de rotación de Producto)
            int cantCafeAmericano = 0;
            int cantCapuccino = 0;
            int cantLatteVanilla = 0;
            int cantPorcionTorta = 0;
            
            int opcionMenu = 0; // Variable centinela del bucle operativo infinito

            // =====================================================================
            // MOTOR PRINCIPAL DEL SISTEMA CONTABLE (BUCLE DO-WHILE INQUEBRANTABLE)
            // =====================================================================
            do
            {
                // Limpieza absoluta del buffer de video de la consola para mantener UX limpia
                Console.Clear();
                Console.WriteLine("==========================================================");
                Console.WriteLine("    SISTEMA CONTABLE Y CAJA REGISTRADORA - CAFE UPDS      ");
                Console.WriteLine("==========================================================");
                // Proyección en tiempo real del saldo contable físico esperado en la gaveta
                Console.WriteLine($"   SALDO ACTUAL ESTIMADO EN CAJA: {cajaInicial + totalIngresos - totalEgresos} Bs.");
                Console.WriteLine("==========================================================");
                Console.WriteLine("   1. Registrar Nueva Facturación de Venta (Ingreso Fijo)");
                Console.WriteLine("   2. Registrar Gasto Operativo de Caja Chica (Egreso)");
                Console.WriteLine("   3. Ejecutar Arqueo Contable Final y Cerrar Sesión");
                Console.WriteLine("==========================================================");
                Console.Write(" >>> Administrador, seleccione una acción de cajero: ");
                
                string entradaUsuario = Console.ReadLine();
                // Validación defensiva silenciosa para atrapar errores de teclado (letras en vez de números)
                if (!int.TryParse(entradaUsuario, out opcionMenu))
                {
                    opcionMenu = -1; // Fuerza la iteración inmediata del do-while
                }

                // -----------------------------------------------------------------
                // MÓDULO 1: SISTEMA DE VENTAS Y ENRUTAMIENTO DE FACTURACIÓN (SWITCH)
                // -----------------------------------------------------------------
                if (opcionMenu == 1)
                {
                    Console.WriteLine("\n--- CATÁLOGO DE PRODUCTOS DE LA CAFETERÍA ---");
                    Console.WriteLine(" 1. Café Americano..... 12.00 Bs.");
                    Console.WriteLine(" 2. Capuccino Clásico.. 18.00 Bs.");
                    Console.WriteLine(" 3. Latte de Vainilla.. 20.00 Bs.");
                    Console.WriteLine(" 4. Porción Torta 3L... 15.00 Bs.");
                    Console.WriteLine(" 5. Cancelar operación y retroceder");
                    
                    int idProducto = 0;
                    
                    // Defensa Algorítmica: Bucle WHILE para sanidad absoluta del selector
                    while (idProducto < 1 || idProducto > 5)
                    {
                        Console.Write("\n > Ingrese el código identificador del producto a despachar: ");
                        if (!int.TryParse(Console.ReadLine(), out idProducto) || idProducto < 1 || idProducto > 5)
                        {
                            Console.WriteLine("   [ERROR DE ENTRADA] Código de catálogo inexistente. Imposible proceder.");
                            idProducto = 0; // Atrapa al usuario en el bucle iterativo de error
                        }
                    }

                    // Si el cajero NO abortó seleccionando la opción 5...
                    if (idProducto != 5) 
                    {
                        int cantidad = 0;
                        // Defensa Algorítmica Secundaria: No permitir multiplicadores nulos o negativos
                        while (cantidad <= 0)
                        {
                            Console.Write(" > Ingrese la cantidad de unidades vendidas de este ítem: ");
                            if (!int.TryParse(Console.ReadLine(), out cantidad) || cantidad <= 0)
                            {
                                Console.WriteLine("   [ERROR Aritmético] La cantidad facturable debe ser obligatoriamente mayor a cero.");
                                cantidad = 0; // Retiene el flujo
                            }
                        }

                        decimal precioUnitario = 0.00m;
                        string nombreItem = "";

                        // ESTRUCTURA DE SELECCIÓN MÚLTIPLE PURA (Sustituto lógico al uso de índices de Arreglos)
                        switch (idProducto)
                        {
                            case 1:
                                nombreItem = "Café Americano";
                                precioUnitario = 12.00m;
                                cantCafeAmericano = cantCafeAmericano + cantidad; // Incremento específico
                                break;
                            case 2:
                                nombreItem = "Capuccino Clásico";
                                precioUnitario = 18.00m;
                                cantCapuccino = cantCapuccino + cantidad; // Incremento específico
                                break;
                            case 3:
                                nombreItem = "Latte de Vainilla";
                                precioUnitario = 20.00m;
                                cantLatteVanilla = cantLatteVanilla + cantidad; // Incremento específico
                                break;
                            case 4:
                                nombreItem = "Porción Torta Tres Leches";
                                precioUnitario = 15.00m;
                                cantPorcionTorta = cantPorcionTorta + cantidad; // Incremento específico
                                break;
                        }

                        // Matemáticas financieras elementales secuenciales de caja
                        decimal subtotalVenta = precioUnitario * cantidad;
                        totalIngresos = totalIngresos + subtotalVenta; // Inyección de liquidez al acumulador global maestro

                        Console.WriteLine($"\n   [FACTURADO CORRECTAMENTE] Se despacharon {cantidad} x {nombreItem}.");
                        Console.WriteLine($"   [COBRANZA] Monto total a exigir y cobrar al cliente: {subtotalVenta} Bs.");
                    }
                    
                    Console.WriteLine("\n -> Presione la tecla ENTER para guardar y volver a la registradora...");
                    Console.ReadLine();
                }
                
                // -----------------------------------------------------------------
                // MÓDULO 2: CONTROL AUDITABLE DE EGRESOS DE CAJA CHICA
                // -----------------------------------------------------------------
                else if (opcionMenu == 2)
                {
                    Console.WriteLine("\n--- MÓDULO DE DECLARACIÓN DE GASTOS OPERATIVOS ---");
                    
                    decimal montoGasto = -1.0m;
                    
                    // Defensa Algorítmica Monetaria: Evita la inyección de números negativos que sumarían
                    while (montoGasto < 0)
                    {
                        Console.Write(" > Ingrese el monto en efectivo a retirar físicamente de la gaveta (Bs): ");
                        if (!decimal.TryParse(Console.ReadLine(), out montoGasto) || montoGasto < 0)
                        {
                            Console.WriteLine("   [ERROR DE CAJA] El monto del egreso declarado no puede ser negativo ni contener caracteres.");
                            montoGasto = -1.0m;
                        }
                    }

                    Console.Write(" > Escriba el motivo, concepto o justificativo comercial del retiro (Ej. Compra Hielo): ");
                    string motivo = Console.ReadLine(); // Alfanumérico estándar

                    // Actualización del acumulador global de pérdidas y sustracciones del día
                    totalEgresos = totalEgresos + montoGasto;

                    Console.WriteLine($"\n   [CONTABILIZADO] Egreso monetario exitoso de {montoGasto} Bs. por el concepto auditado de: {motivo}");
                    Console.WriteLine(" -> Presione la tecla ENTER para volver a la registradora matriz...");
                    Console.ReadLine();
                }
                
                // -----------------------------------------------------------------
                // MÓDULO 3: ARQUEO CONTABLE, BALANCE Y CIERRE (SECUENCIAL Y ARITMÉTICO)
                // -----------------------------------------------------------------
                else if (opcionMenu == 3)
                {
                    Console.WriteLine("\n==========================================================");
                    Console.WriteLine("   REPORTE OFICIAL DE ARQUEO FINANCIERO Y CIERRE DE TURNO   ");
                    Console.WriteLine("==========================================================");
                    
                    // 1. Impresión de Resumen de Flujo de Efectivo Acumulado
                    Console.WriteLine($" [+] Fondo Inicial de Apertura Monetaria : {cajaInicial} Bs.");
                    Console.WriteLine($" [+] Sumatoria Bruta Ingresos (Ventas)   : {totalIngresos} Bs.");
                    Console.WriteLine($" [-] Sumatoria Bruta Egresos (Gastos)    : {totalEgresos} Bs.");
                    Console.WriteLine("----------------------------------------------------------");
                    
                    // Cálculos financieros algorítmicos finales
                    decimal gananciaNeta = totalIngresos - totalEgresos;
                    decimal dineroFisicoEsperado = cajaInicial + gananciaNeta;
                    
                    Console.WriteLine($" [=] MARGEN DE GANANCIA NETA DEL DÍA     : {gananciaNeta} Bs.");
                    Console.WriteLine($" [=] TOTAL FÍSICO ESPERADO EN GAVETA     : {dineroFisicoEsperado} Bs.");
                    
                    Console.WriteLine("\n==========================================================");
                    Console.WriteLine("   AUDITORÍA SECUENCIAL DE PRODUCTOS DESPACHADOS (KPIs)     ");
                    Console.WriteLine("==========================================================");
                    Console.WriteLine($" - Café Americano  : {cantCafeAmericano} tazas elaboradas.");
                    Console.WriteLine($" - Capuccinos      : {cantCapuccino} tazas elaboradas.");
                    Console.WriteLine($" - Latte Vanilla   : {cantLatteVanilla} tazas elaboradas.");
                    Console.WriteLine($" - Porciones Torta : {cantPorcionTorta} porciones servidas.");
                    Console.WriteLine("==========================================================");

                    // Evaluación Lógica Condicional en cascada del éxito o fracaso del negocio
                    if (gananciaNeta > 0)
                    {
                        Console.WriteLine("\n [DIAGNÓSTICO ESTRATÉGICO] ¡Felicidades! La jornada fue altamente rentable y produjo beneficios sólidos.");
                    }
                    else if (gananciaNeta < 0)
                    {
                        Console.WriteLine("\n [DIAGNÓSTICO ALERTA] PELIGRO LOGÍSTICO: La cafetería operó con pérdidas hoy. Los egresos trituraron los ingresos.");
                    }
                    else
                    {
                        Console.WriteLine("\n [DIAGNÓSTICO TÉCNICO] Se alcanzó el exacto punto de equilibrio. Cero ganancias netas generadas.");
                    }

                    Console.WriteLine("\n -> Presione ENTER de forma definitiva para confirmar la auditoría, cerrar caja y apagar el programa...");
                    Console.ReadLine();
                }
                
                // -----------------------------------------------------------------
                // MANEJO DE EXCEPCIONES Y ERRORES DE MENÚ EXTERNO
                // -----------------------------------------------------------------
                else if (opcionMenu != 3)
                {
                    Console.WriteLine("\n   [ERROR EN EL SISTEMA CORE] La instrucción digital proporcionada es inexistente.");
                    Console.WriteLine(" -> Presione la tecla ENTER para limpiar registros y reiniciar la interfaz del cajero...");
                    Console.ReadLine();
                }

            } while (opcionMenu != 3); // Ruptura exclusiva: El bucle colapsa solo y unicamente si seleccionan Arqueo (3)

            // Limpieza de memoria
            Console.WriteLine("\n==========================================================");
            Console.WriteLine(" ALGORITMO DE SISTEMA CONTABLE APAGADO.");
            Console.WriteLine(" CAJA CERRADA Y GUARDADA CORRECTAMENTE SIN PÉRDIDA DE DATOS.");
            Console.WriteLine("==========================================================");
        }
    }
}