using System;

namespace SistemaInventarioKiosco
{
    class Program
    {
        static void Main(string[] args)
        {
            // =========================================================
            // BASE DE DATOS PLANA - SIN VECTORES NI LISTAS
            // =========================================================
            // Producto 1
            string nombre1 = "Gaseosa Cola 2L";
            int stockActual1 = 5;
            int stockMinimo1 = 10;
            int stockMaximo1 = 30;
            int unidadesPorCaja1 = 6;

            // Producto 2
            string nombre2 = "Galletas Saladas";
            int stockActual2 = 20;
            int stockMinimo2 = 15;
            int stockMaximo2 = 50;
            int unidadesPorCaja2 = 12;

            // Producto 3
            string nombre3 = "Chocolates Finos";
            int stockActual3 = 8;
            int stockMinimo3 = 10;
            int stockMaximo3 = 40;
            int unidadesPorCaja3 = 20;

            int opcion = 0;

            // =========================================================
            // MOTOR PRINCIPAL DEL SISTEMA - CICLO DO-WHILE INFINITO
            // =========================================================
            do
            {
                Console.Clear();
                Console.WriteLine("==========================================================================");
                Console.WriteLine("    SISTEMA INTEGRAL DE GESTIÓN Y AUDITORÍA DE INVENTARIO - KIOSCO UPDS   ");
                Console.WriteLine("==========================================================================");
                Console.WriteLine("   1. Visualizar Estado Físico Consolidado del Inventario");
                Console.WriteLine("   2. Registrar Transacción de Venta Directa (Sustracción de Stock)");
                Console.WriteLine("   3. Generar Reporte Algorítmico de Reabastecimiento a Proveedores");
                Console.WriteLine("   4. Finalizar Operaciones y Salir Seguramente del Sistema");
                Console.WriteLine("==========================================================================");
                Console.Write(" >>> Seleccione una opción operativa tecleando el número correspondiente: ");
                
                string entradaUsuario = Console.ReadLine();
                
                if (!int.TryParse(entradaUsuario, out opcion))
                {
                    opcion = -1; // Fuerza el error para que el ciclo se repita
                }

                // ---------------------------------------------------------
                // MÓDULO 1: VISUALIZACIÓN LÓGICA SECUENCIAL
                // ---------------------------------------------------------
                if (opcion == 1)
                {
                    Console.WriteLine("\n--- ESTADO ACTUAL DEL ALMACÉN Y ESTANTERÍAS ---");
                    
                    Console.WriteLine($"  [ID: 1] | {nombre1.PadRight(20)} | Stock Físico: {stockActual1} unidades");
                    Console.WriteLine($"  [ID: 2] | {nombre2.PadRight(20)} | Stock Físico: {stockActual2} unidades");
                    Console.WriteLine($"  [ID: 3] | {nombre3.PadRight(20)} | Stock Físico: {stockActual3} unidades");
                    
                    Console.WriteLine("\n -> Presione la tecla ENTER para continuar con la operación y retornar al menú...");
                    Console.ReadLine();
                }
                
                // ---------------------------------------------------------
                // MÓDULO 2: TRANSACCIÓN DE VENTA (SIN VECTORES)
                // ---------------------------------------------------------
                else if (opcion == 2)
                {
                    Console.WriteLine("\n--- MÓDULO TRANSSACIONAL DE REGISTRO DE VENTA RÁPIDA ---");
                    int idSeleccionado = -1;
                    
                    // Ciclo WHILE: Validación defensiva
                    while (idSeleccionado < 1 || idSeleccionado > 3)
                    {
                        Console.Write("  > Ingrese el ID numérico del producto a vender (1 a 3): ");
                        
                        if (!int.TryParse(Console.ReadLine(), out idSeleccionado) || idSeleccionado < 1 || idSeleccionado > 3)
                        {
                            Console.WriteLine("      [ERROR FATAL] El ID ingresado es inválido o no existe.");
                            idSeleccionado = -1; 
                        }
                    }

                    int cantidadVender = 0;
                    
                    // Ciclo WHILE: Validación de cantidad
                    while (cantidadVender <= 0)
                    {
                        Console.Write($"  > Ingrese la cantidad de unidades a vender: ");
                        
                        if (!int.TryParse(Console.ReadLine(), out cantidadVender) || cantidadVender <= 0)
                        {
                            Console.WriteLine("      [ERROR LÓGICO] Ingrese un número entero positivo mayor a cero.");
                            cantidadVender = 0; 
                        }
                    }

                    // Lógica Condicional Plana (Hardcodeada por la falta de vectores)
                    if (idSeleccionado == 1)
                    {
                        if (cantidadVender <= stockActual1)
                        {
                            stockActual1 = stockActual1 - cantidadVender;
                            Console.WriteLine($"\n    [TRANSACCIÓN APROBADA] Nuevo saldo de {nombre1}: {stockActual1} unidades.");
                        }
                        else
                        {
                            Console.WriteLine($"\n    [TRANSACCIÓN DENEGADA] Stock insuficiente. Solo hay {stockActual1} unidades.");
                        }
                    }
                    else if (idSeleccionado == 2)
                    {
                        if (cantidadVender <= stockActual2)
                        {
                            stockActual2 = stockActual2 - cantidadVender;
                            Console.WriteLine($"\n    [TRANSACCIÓN APROBADA] Nuevo saldo de {nombre2}: {stockActual2} unidades.");
                        }
                        else
                        {
                            Console.WriteLine($"\n    [TRANSACCIÓN DENEGADA] Stock insuficiente. Solo hay {stockActual2} unidades.");
                        }
                    }
                    else if (idSeleccionado == 3)
                    {
                        if (cantidadVender <= stockActual3)
                        {
                            stockActual3 = stockActual3 - cantidadVender;
                            Console.WriteLine($"\n    [TRANSACCIÓN APROBADA] Nuevo saldo de {nombre3}: {stockActual3} unidades.");
                        }
                        else
                        {
                            Console.WriteLine($"\n    [TRANSACCIÓN DENEGADA] Stock insuficiente. Solo hay {stockActual3} unidades.");
                        }
                    }
                    
                    Console.WriteLine("\n -> Presione la tecla ENTER para retornar al panel principal...");
                    Console.ReadLine();
                }
                
                // ---------------------------------------------------------
                // MÓDULO 3: LOGÍSTICA (DIV Y MOD, SIN VECTORES)
                // ---------------------------------------------------------
                else if (opcion == 3)
                {
                    Console.WriteLine("\n--- MÓDULO ALGORÍTMICO CENTRAL DE REABASTECIMIENTO ---");
                    bool necesitaPedidos = false; 

                    // PRODUCTO 1
                    if (stockActual1 <= stockMinimo1)
                    {
                        necesitaPedidos = true; 
                        Console.WriteLine($"\n==========================================================================");
                        Console.WriteLine($"  [!] ALERTA ROJA ACTIVADA: {nombre1}");
                        Console.WriteLine($"      Estado: Crítico ({stockActual1} unidades). Mínimo permitido: {stockMinimo1}");
                        
                        int faltante = stockMaximo1 - stockActual1; 
                        int cajasCompletas = faltante / unidadesPorCaja1; // Operación DIV (Truncamiento natural)
                        int unidadesSueltas = faltante % unidadesPorCaja1; // Operación MOD (Residuo puro)

                        Console.WriteLine($"      Déficit calculado para alcanzar el tope ({stockMaximo1}): {faltante} unidades.");
                        Console.WriteLine($"      -> Solicitud de Cajas: {cajasCompletas} Caja(s) sellada(s) (Lote de {unidadesPorCaja1} u.)");
                        Console.WriteLine($"      -> Solicitud de Fracciones : {unidadesSueltas} Unidad(es) suelta(s)");
                    }

                    // PRODUCTO 2
                    if (stockActual2 <= stockMinimo2)
                    {
                        necesitaPedidos = true; 
                        Console.WriteLine($"\n==========================================================================");
                        Console.WriteLine($"  [!] ALERTA ROJA ACTIVADA: {nombre2}");
                        Console.WriteLine($"      Estado: Crítico ({stockActual2} unidades). Mínimo permitido: {stockMinimo2}");
                        
                        int faltante = stockMaximo2 - stockActual2; 
                        int cajasCompletas = faltante / unidadesPorCaja2; // DIV
                        int unidadesSueltas = faltante % unidadesPorCaja2; // MOD

                        Console.WriteLine($"      Déficit calculado para alcanzar el tope ({stockMaximo2}): {faltante} unidades.");
                        Console.WriteLine($"      -> Solicitud de Cajas: {cajasCompletas} Caja(s) sellada(s) (Lote de {unidadesPorCaja2} u.)");
                        Console.WriteLine($"      -> Solicitud de Fracciones : {unidadesSueltas} Unidad(es) suelta(s)");
                    }

                    // PRODUCTO 3
                    if (stockActual3 <= stockMinimo3)
                    {
                        necesitaPedidos = true; 
                        Console.WriteLine($"\n==========================================================================");
                        Console.WriteLine($"  [!] ALERTA ROJA ACTIVADA: {nombre3}");
                        Console.WriteLine($"      Estado: Crítico ({stockActual3} unidades). Mínimo permitido: {stockMinimo3}");
                        
                        int faltante = stockMaximo3 - stockActual3; 
                        int cajasCompletas = faltante / unidadesPorCaja3; // DIV
                        int unidadesSueltas = faltante % unidadesPorCaja3; // MOD

                        Console.WriteLine($"      Déficit calculado para alcanzar el tope ({stockMaximo3}): {faltante} unidades.");
                        Console.WriteLine($"      -> Solicitud de Cajas: {cajasCompletas} Caja(s) sellada(s) (Lote de {unidadesPorCaja3} u.)");
                        Console.WriteLine($"      -> Solicitud de Fracciones : {unidadesSueltas} Unidad(es) suelta(s)");
                    }

                    if (necesitaPedidos == false)
                    {
                        Console.WriteLine("\n  [INFORME] Todos los parámetros numéricos se encuentran dentro de los márgenes saludables.");
                    }

                    Console.WriteLine("\n==========================================================================");
                    Console.WriteLine(" -> Presione la tecla ENTER para salir del reporte y volver al menú maestro...");
                    Console.ReadLine();
                }
                
                // ---------------------------------------------------------
                // EXCEPCIONES DE MENÚ
                // ---------------------------------------------------------
                else if (opcion != 4)
                {
                    Console.WriteLine("\n  [ERROR CRÍTICO] La opción de menú es inválida.");
                    Console.WriteLine(" -> Presione la tecla ENTER para limpiar la pantalla y reiniciar...");
                    Console.ReadLine();
                }

            } while (opcion != 4);

            Console.WriteLine("\n==========================================================================");
            Console.WriteLine(" Cierre de sesión exitoso. Proceso finalizado. Adiós.");
            Console.WriteLine("==========================================================================");
        }
    }
}