package iostar.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserModel implements Serializable {
    private int id;
    private String username;
    private String password;
    private String fullname;
    private String email;
    private String phone;
    private String role;
    private boolean locked;

}