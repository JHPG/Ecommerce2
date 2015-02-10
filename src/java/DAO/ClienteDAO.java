/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Pedido;
import Model.Cliente;
import Model.Produto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.http.HttpSession;

/**
 *
 * @author marianaalvarez
 */
public class ClienteDAO {
    Connection conexao;
       
    public Cliente getCliente(String login) throws SQLException{
        try{
            Connection conexao = DriverManager.getConnection("jdbc:derby://localhost:1527/BD_Ecommerce","root","1234");
            String sql= "Select * from Cliente where login=?";

            PreparedStatement stmt2 = conexao.prepareStatement(sql);
            
            stmt2.setString(1, login);

            ResultSet rs = stmt2.executeQuery();

            //List <Produto> prodLista = new ArrayList();
            Cliente cli = null;

            while(rs.next()){
                //Cria objeto produto
                String login2 = rs.getString("login");
                String senha = rs.getString("senha");
                String nome = rs.getString("nome").toString();
                String cpf  = rs.getString("CPF").toString();
                String endereco = rs.getString("endereco").toString();

                cli = new Cliente(nome, login, senha, cpf, endereco, "");
            }
            return cli;
            
        } catch(SQLException e){
                return null;
        }
    }

    
}
