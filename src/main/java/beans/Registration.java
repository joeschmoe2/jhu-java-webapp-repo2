package beans;

import java.io.Serializable;

/**
 * Created by joff on 3/14/17.
 */
public class Registration implements Serializable {

    private String name;
    private String email;
    private String[] courses;
    private String employment;
    private String[] fees;

    public Registration() {
        name ="";
        email ="";
        courses = null;
        employment = "";
        fees = null;
    }

    public Registration(String name, String email, String[] courses, String employment, String[] fees) {
        this.name =name;
        this.email =email;
        this.courses = courses;
        this.employment = employment;
        this.fees = fees;
    }

    public String getName(){
        return name;
    }

    public String getEmail(){
        return email;
    }

    public String getEmployment(){
        return employment;
    }

    public String[] getCourses(){
        return courses;
    }

    public String[] getFees(){
        return fees;
    }

    public void setName(String name){
        this.name = name;
    }

    public void setEmail(String email){
        this.email = email;
    }

    public void setEmployment(String employment){
        this.employment = employment;
    }

    public void setCourses(String[] courses){
        this.courses = courses;
    }

    public void setFees(String[] fees){
        this.fees = fees;
    }
    public void removeCourse(String value){
        int i = Integer.parseInt(value);
        String errorTracker="";
        try {
            errorTracker+="Step 1";
            if(this.courses != null && this.courses.length > 1) {
                errorTracker+=", Step 2";
                String[] newCourses = new String[this.courses.length - 1];
                errorTracker+=", Step 3";
                for (int x = 0; x < this.courses.length; x++) {
                    errorTracker+=", Step 4";
                    if (x < i)
                        newCourses[x] = this.courses[x];
                    else if (x > i)
                        newCourses[x - 1] = this.courses[x];
                }
                errorTracker+=", Step 5";
                this.courses = newCourses;
                errorTracker+=", Step 6";
            }
            else
                this.courses = null;
        }
        catch (Exception exc){
            throw new RuntimeException("Course not found : " + exc.getMessage() + " :: " + errorTracker);
        }
    }
}
