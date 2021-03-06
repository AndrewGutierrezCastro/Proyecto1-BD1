﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto1_BD1
{
    class FuncionesClientes
    {
        private readonly int numPersonas = 100;
        private readonly int numOrganizaciones = 100;
        private DataTable tablaPersonas;
        private DataTable tablaOrganizaciones;
        private List<Persona> personas;
        private List<Organizacion> organizaciones;
        private SqlConnection conexionSqlBd;
        public ConectionBD conectionBD;
        public FuncionesClientes(SqlConnection pConexionBD)
        {
            ConexionBD = pConexionBD;
        }

        public DataTable TablaPersonas { get => tablaPersonas; set => tablaPersonas = value; }
        public DataTable TablaOrganizaciones { get => tablaOrganizaciones; set => tablaOrganizaciones = value; }
        public SqlConnection ConexionBD { get => conexionSqlBd; set => conexionSqlBd = value; }
        internal List<Persona> Personas { get => personas; set => personas = value; }
        internal List<Organizacion> Organizaciones { get => organizaciones; set => organizaciones = value; }

        public void CargarClientesBDtoLocal()
        {
            Personas = new List<Persona>();
            Organizaciones = new List<Organizacion>();
            tablaPersonas = new DataTable();
            tablaOrganizaciones = new DataTable();
            if (conexionSqlBd.State == ConnectionState.Open)
            {
                conectionBD.closeConnection();
                conectionBD.openConnection();
            }
            else
            {
                conectionBD.openConnection();
            }
            SqlDataAdapter listarPersonas = new SqlDataAdapter("SELECT TOP (" + numPersonas + ") [Estado], [Cedula] ,[Nombre] ,[Direccion] ,[Numero] FROM ViewPersonas", ConexionBD);
            listarPersonas.Fill(TablaPersonas);

            SqlDataAdapter listarOrganizaciones = new SqlDataAdapter("SELECT TOP (" + numOrganizaciones + ") [Estado], [CedulaJuridica], [Nombre] ,[Ciudad] ,[Direccion] ,[Nombre_Contacto] ,[Cargo_Contacto] ,[Numero] FROM ViewOrganizaciones", ConexionBD);
            listarOrganizaciones.Fill(TablaOrganizaciones);

            /*
             Importante saber que, la vista de Personas tiene el orden de Cedula, Nombre, Direccion, Numero
             y la de organizaciones CedulaJuridica, Ciudad, Direccion, NombreContacto, Cargocontacto, Numero
             */
            String[] datosPersona = new String[] { "Estado", "Cedula", "Nombre", "Direccion", "Numero" };
            foreach (DataRow row in TablaPersonas.Rows)
            {
                for (int i = 0; i < datosPersona.GetLength(0); i++)
                {
                    datosPersona[i] = row[i].ToString();
                }
                Personas.Add(new Persona(datosPersona[0], datosPersona[1], datosPersona[2], datosPersona[3], datosPersona[4]));

            }
            String[] datosOrganizacion = new String[] { "Estado", "CedulaJ", "Nombre", "Ciudad", "Direccion", "NombreCon", "CargoCon", "Numero" };
            foreach (DataRow row in TablaOrganizaciones.Rows)
            {
                for (int i = 0; i < datosOrganizacion.GetLength(0); i++)
                {
                    datosOrganizacion[i] = row[i].ToString();
                }
                Organizaciones.Add(new Organizacion(datosOrganizacion[0], datosOrganizacion[1], datosOrganizacion[2],
                 datosOrganizacion[3], datosOrganizacion[4], datosOrganizacion[5], datosOrganizacion[6], datosOrganizacion[7]));
            }

        }
        public int CrearNuevaPersona(String[] datosPersona)
        {

            /*
             *POSIBLES RESPUESTAS
	             0 = caso exitoso
	            -1 = cedula invalida
	            -2 = nombre invalida
	            -3 = Direccion invalido
	            -4 = Numero no invalido
	            -5 = Estado invalido
	            -6 = Persona ya existe 
              
	         *"Estado", "Cedula", "Nombre", "Direccion", "Numero"
	        */
            if (datosPersona[1] == "")
            {
                return -1;
            }
            else if (datosPersona[2] == "")
            {
                return -2;
            }
            else if (datosPersona[3] == "")
            {
                return -3;
            }
            else if (datosPersona[4] == "")
            {
                return -4;
            }
            if (existePersona(datosPersona))
            {
                return -6;
            }
            else
            {
                //"Estado", "Cedula", "Nombre", "Direccion", "Numero"
                /*  @Cedula nchar(32), == 1
	                @Nombre nchar(128), == 2
	                @Direccion nchar(256), == 3
	                @Numero nchar(24), == 4
	                @Estado nchar(10), == 0
                 */
                conectionBD.conexionBD = this.ConexionBD;
                if (this.ConexionBD.State == ConnectionState.Open)
                {
                    this.conectionBD.closeConnection();
                    this.conectionBD.openConnection();
                }
                else
                {
                    this.conectionBD.openConnection();
                }
                using (conexionSqlBd)
                {
                    using (SqlCommand comandoCrearPersona = new SqlCommand("CreatePersona", conexionSqlBd))
                    {
                        comandoCrearPersona.CommandType = CommandType.StoredProcedure;
                        comandoCrearPersona.Parameters.Add("@Estado", SqlDbType.VarChar).Value = datosPersona[0];
                        comandoCrearPersona.Parameters.Add("@Cedula", SqlDbType.VarChar).Value = datosPersona[1];
                        comandoCrearPersona.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = datosPersona[2];
                        comandoCrearPersona.Parameters.Add("@Direccion", SqlDbType.VarChar).Value = datosPersona[3];
                        comandoCrearPersona.Parameters.Add("@Numero", SqlDbType.VarChar).Value = datosPersona[4];
                        comandoCrearPersona.Parameters.Add("@RespuestaOperacion", SqlDbType.TinyInt).Direction = ParameterDirection.Output;
                        comandoCrearPersona.ExecuteNonQuery();


                        int respuestaOperacion = int.Parse(comandoCrearPersona.Parameters["@RespuestaOperacion"].Value.ToString());
                        if (respuestaOperacion == 0)
                        {
                            CargarClientesBDtoLocal();
                        }
                        return respuestaOperacion;

                    }
                }

            }
        }

        public int CrearNuevaOrganizacion(String[] datosOrganizacion)
        {

            /*
             *POSIBLES RESPUESTAS
	             0 = caso exitoso
	            -1 = cedulaJuridica invalida
	            -2 = nombre invalida
	            -3 = Direccion invalido
	            -4 = Ciudad  invalida
	            -5 = Numero invalido
	            -6 = NombreContacto invalido
	            -7 = Cargo de Contacto invalido
	            -8 = Estado invalido
	            -9 = Organizacion ya existe
	         *"Estado", "Cedula", "Nombre", "Direccion", "Numero"
	        */
            if (datosOrganizacion[1] == "")
            {
                return -1;
            }
            else if (datosOrganizacion[2] == "")
            {
                return -2;
            }
            else if (datosOrganizacion[3] == "")
            {
                return -3;
            }
            else if (datosOrganizacion[4] == "")
            {
                return -4;
            }
            else if (datosOrganizacion[5] == "")
            {
                return -6;
            }
            else if (datosOrganizacion[6] == "")
            {
                return -7;
            }
            else if (datosOrganizacion[7] == "")
            {
                return -5;
            }
            if (existeOrganizacion(datosOrganizacion))
            {
                return -9;
            }
            else
            {
                //"Estado", "CedulaJ", "Nombre", "Ciudad", "Direccion", "NombreCon", "CargoCon", "Numero" 
                /*  @CedulaJuridica nchar(32), == 1
                    @Nombre nchar(128), == 2
                    @Direccion nchar(256), == 4
                    @Ciudad nchar(64), == 3
                    @Numero nchar(24), == 7
                    @NombreContacto nchar(128), == 5
                    @CargoContacto nchar(64), == 6
                    @Estado nchar(10), == 0
                 */
                conectionBD.conexionBD = this.ConexionBD;
                if (this.ConexionBD.State == ConnectionState.Open)
                {
                    this.conectionBD.closeConnection();
                    this.conectionBD.openConnection();
                }
                else
                {
                    this.conectionBD.openConnection();
                }
                using (this.ConexionBD)
                {
                    using (SqlCommand comandoCrearOrganizacion = new SqlCommand("CreateOrganizacion", this.ConexionBD))
                    {
                        comandoCrearOrganizacion.CommandType = CommandType.StoredProcedure;
                        comandoCrearOrganizacion.Parameters.Add("@Estado", SqlDbType.VarChar).Value = datosOrganizacion[0];
                        comandoCrearOrganizacion.Parameters.Add("@CedulaJuridica", SqlDbType.VarChar).Value = datosOrganizacion[1];
                        comandoCrearOrganizacion.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = datosOrganizacion[2];
                        comandoCrearOrganizacion.Parameters.Add("@Direccion", SqlDbType.VarChar).Value = datosOrganizacion[4];
                        comandoCrearOrganizacion.Parameters.Add("@Ciudad", SqlDbType.VarChar).Value = datosOrganizacion[3];
                        comandoCrearOrganizacion.Parameters.Add("@NombreContacto", SqlDbType.VarChar).Value = datosOrganizacion[5];
                        comandoCrearOrganizacion.Parameters.Add("@CargoContacto", SqlDbType.VarChar).Value = datosOrganizacion[6];
                        comandoCrearOrganizacion.Parameters.Add("@Numero", SqlDbType.VarChar).Value = datosOrganizacion[7];
                        comandoCrearOrganizacion.Parameters.Add("@RespuestaOperacion", SqlDbType.Int).Direction = ParameterDirection.Output;
                        comandoCrearOrganizacion.ExecuteNonQuery();

                        int respuestaOperacion = int.Parse(comandoCrearOrganizacion.Parameters["@RespuestaOperacion"].Value.ToString());
                        if (respuestaOperacion == 0)
                        {
                            CargarClientesBDtoLocal();
                        }
                        return respuestaOperacion;

                    }
                }

            }
        }

        public int UpdatePersona(String[] datosPersona)
        {
            if (!existePersona(datosPersona))
            {
                return -1;
            }
            else
            {
                /*
                @Cedula nchar(32),
	            @Nombre nchar(128),
	            @Direccion nchar(256),
	            @Numero nchar(24),
	            @Estado nchar(10),
                 */
                String[] parametros = new string[] { "@Estado", "@Cedula", "@Nombre", "@Direccion", "@Numero" };

                int respuestaOperacion = conectionBD.EjecutarProcedimientoAlmacenado("UpdatePersona", parametros, datosPersona, conexionSqlBd);
                if (respuestaOperacion == 0)
                {
                    this.ConexionBD = conexionSqlBd;
                    CargarClientesBDtoLocal();
                }
                return respuestaOperacion;


            }
        }
        private bool existePersona(String[] pDatosPersona)
        {
            foreach (Persona persona in Personas)
            {
                if (persona.Cedula.StartsWith(pDatosPersona[1]))
                {
                    return true;
                }
            }
            return false;
        }

        public int UpdateOrganizacion(String[] datosOrganizacion)
        {
            if (!existeOrganizacion(datosOrganizacion))
            {
                return -1;
            }
            else
            {
                /*
                @CedulaJuridica nchar(32),
	            @Nombre nchar(128),
	            @Direccion nchar(256),
	            @Ciudad nchar(64),
	            @Numero nchar(24),
	            @NombreContacto nchar(128),
	            @CargoContacto nchar(64),
	            @Estado nchar(10),
	            @RespuestaOperacion int = 0 OUTPUT
                 */
                String[] parametros = new string[] { "@Estado", "@CedulaJuridica", "@Nombre", "@Ciudad", "@Direccion", "@NombreContacto", "@CargoContacto", "@Numero" };

                int respuestaOperacion = conectionBD.EjecutarProcedimientoAlmacenado("UpdateOrganizacion", parametros, datosOrganizacion, conexionSqlBd);
                if (respuestaOperacion == 0)
                {
                    this.ConexionBD = conexionSqlBd;
                    CargarClientesBDtoLocal();
                }
                return respuestaOperacion;


            }
        }
        private bool existeOrganizacion(String[] pDatosOrganizacion)
        {
            foreach (Organizacion organizacion in organizaciones)
            {
                if (organizacion.CedulaJuridica.StartsWith(pDatosOrganizacion[1]))
                {
                    return true;
                }
            }

            return false;
        }

        public int UpdateEstadoCliente(String[] datosCliente, bool isOrganizacion)
        {
            if (isOrganizacion)
            {
                if (!(existeOrganizacion(datosCliente)))
                {
                    return -1;
                }
                else
                {
                    String[] parametros = new string[] { "@Estado", "@Cedula" };

                    int respuestaOperacion = conectionBD.EjecutarProcedimientoAlmacenado("UpdateEstadoOrganizacion", parametros, datosCliente, conexionSqlBd);
                    if (respuestaOperacion == 0)
                    {
                        this.ConexionBD = conexionSqlBd;
                        CargarClientesBDtoLocal();
                    }
                    return respuestaOperacion;
                }
            }
            else
            {
                if (!(existePersona(datosCliente)))
                {
                    return -1;
                }
                else
                {
                    String[] parametros = new string[] { "@Estado", "@Cedula" };

                    int respuestaOperacion = conectionBD.EjecutarProcedimientoAlmacenado("UpdateEstadoPersona", parametros, datosCliente, conexionSqlBd);
                    if (respuestaOperacion == 0)
                    {
                        this.ConexionBD = conexionSqlBd;
                        CargarClientesBDtoLocal();
                    }
                    return respuestaOperacion;
                }
            }
        }
    }
}
