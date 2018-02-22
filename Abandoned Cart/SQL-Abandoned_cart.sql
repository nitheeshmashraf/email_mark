CART INCLUSION

SELECT $C$.RIID_,$C$.EMAIL_ADDRESS_ FROM (

SELECT $A$.RIID_ FROM $A$ WHERE TO_CHAR( $A$.MODIFIED_DATE_, 'DD-MM-YYYY') =TO_CHAR(current_timestamp ,'DD-MM-YYYY')
MINUS
SELECT $B$.RIID_ FROM $B$ WHERE TO_CHAR( $B$.MODIFIED_DATE_, 'DD-MM-YYYY') =TO_CHAR(current_timestamp ,'DD-MM-YYYY')

)INCLUSION_LIST,$C$ WHERE INCLUSION_LIST.RIID_=$C$.RIID_


EXCLUSION

RIID_ WERE SENT RRT CAMPAIGN 1 TIME TODAY






	select RIID_, CA_CITY,CA_PRODUCTID,ROWNUM AS ENTRY_ID, 1 as DK_MATCH from ( 

        select RIID_,TRIM(COLUMN_VALUE) AS CA_PRODUCTID,CA_CITY,CA_LANGUAGE,ROWNUM as ENTRY_ID from ( 
            
            select * from ( 

                SELECT DISTINCT RIID_,regexp_substr(CA_PRODUCTID,'[^,]+',1,level) as CA_PRODUCTID, CA_CITY, CA_LANGUAGE, 1 as ENTRY_ID FROM ( 

                    SELECT DISTINCT $A$.RIID_,$A$.CA_PRODUCTID,REGEXP_REPLACE($A$.CA_CITY,'~','') CA_CITY, REGEXP_REPLACE($A$.CA_LANGUAGE,'~','') CA_LANGUAGE FROM $A$ 
                    WHERE TO_CHAR( $A$.MODIFIED_DATE_, 'DD-MM-YYYY') =TO_CHAR(current_timestamp ,'DD-MM-YYYY')
                    
                ) TEMP CONNECT BY level<=regexp_count(CA_PRODUCTID,',')+1 ORDER BY RIID_ 
                    
            )ps where CA_PRODUCTID is not null 
            
        ) ps ,xmltable(('"'|| REPLACE(ps.CA_PRODUCTID,'~', '","')|| '"')) d 
        
    )lk




    SELECT g.BIG_IMG_URL, g.CITY_, g.DEAL_ID, g.IMG_URL, g.IS_DISCOUNT_VISIBLE, g.MAIL_SUBJECT_AR, g.MAIL_SUBJECT_EN, g.MAIL_SUBJECT_SHORT_AR,  g.MAIL_SUBJECT_SHORT_EN, g.OLD_PRICE, g.PRICE, g.RIID_, 
    g.CA_CITY, g.CA_PRODUCTCATEGORY,g.CA_PRODUCTID, g.TAG_LINE_AR, g.TAG_LINE_EN, g.TITLE_AR, g.TITLE_EN, g.URL_TITLE,$C$.EMAIL_ADDRESS_, '1' as DK_MATCH from (

        SELECT $B$.BIG_IMG_URL, $B$.CITY_, $B$.DEAL_ID, $B$.IMG_URL, $B$.IS_DISCOUNT_VISIBLE, $B$.MAIL_SUBJECT_AR, $B$.MAIL_SUBJECT_EN, $B$.MAIL_SUBJECT_SHORT_AR,  $B$.MAIL_SUBJECT_SHORT_EN, 
        $B$.OLD_PRICE, $B$.PRICE, r.RIID_, r.CA_CITY, r.CA_PRODUCTCATEGORY,r.CA_PRODUCTID, $B$.TAG_LINE_AR, $B$.TAG_LINE_EN, $B$.TITLE_AR, $B$.TITLE_EN, $B$.URL_TITLE from (

            SELECT p.RIID_, p.CA_CITY, p.CA_PRODUCTCATEGORY,p.CA_PRODUCTID from ( 

                select RIID_, CA_CITY, CA_PRODUCTCATEGORY,CA_PRODUCTID,ROWNUM AS ENTRY_ID, 1 as DK_MATCH from ( 

                    select RIID_,TRIM(COLUMN_VALUE) AS CA_PRODUCTID,trim(CA_PRODUCTCATEGORY) AS CA_PRODUCTCATEGORY,CA_PPRICE,CA_CITY,CA_LANGUAGE,CA_TRANSACTION,CA_SESSION,ROWNUM as ENTRY_ID from ( 
                        
                        select * from ( 

                            SELECT DISTINCT RIID_,regexp_substr(CA_PRODUCTID,'[^,]+',1,level) as CA_PRODUCTID,regexp_substr(CA_PRODUCTCATEGORY,'[^,]+',1,level) as CA_PRODUCTCATEGORY, CA_PPRICE, CA_CITY, 
                            CA_LANGUAGE, CA_TRANSACTION, CA_SESSION, 1 as ENTRY_ID FROM ( 

                                SELECT DISTINCT RIID_,CA_PRODUCTID,CA_PRODUCTCATEGORY,CA_PPRICE,REGEXP_REPLACE(CA_CITY,'~','') CA_CITY, REGEXP_REPLACE(CA_LANGUAGE,'~','') CA_LANGUAGE, CA_TRANSACTION, 
                                CA_SESSION FROM $A$ where $A$.CA_TRANSACTION IS NULL 
                                
                            ) TEMP CONNECT BY level<=regexp_count(CA_PRODUCTID,',')+1 CONNECT BY level<=regexp_count(CA_PRODUCTCATEGORY,',')+1 ORDER BY RIID_ 
                                
                        )ps where CA_PRODUCTID is not null 
                        
                    ) ps ,xmltable(('"'|| REPLACE(ps.CA_PRODUCTID,'~', '","')|| '"')) d 
                                    
                )lk   
                                
            )p  
                                
        )r, $B$ where $B$.DEAL_ID=r.CA_PRODUCTID   
                                    
    )g,$C$ where g.RIID_=$C$.RIID_






select r.RIID_,$B$.BIG_IMG_URL, $B$.CITY_, $B$.DEAL_ID, $B$.IMG_URL, $B$.IS_DISCOUNT_VISIBLE, $B$.MAIL_SUBJECT_AR, $B$.MAIL_SUBJECT_EN, $B$.MAIL_SUBJECT_SHORT_AR,  $B$.MAIL_SUBJECT_SHORT_EN, 
        $B$.OLD_PRICE, $B$.PRICE,r.DK_MATCH From (



    select RIID_, CA_CITY,CA_PRODUCTID,ROWNUM AS ENTRY_ID, 1 as DK_MATCH from ( 

        select RIID_,TRIM(COLUMN_VALUE) AS CA_PRODUCTID,CA_CITY,CA_LANGUAGE,ROWNUM as ENTRY_ID from ( 
            
            select * from ( 

                SELECT DISTINCT RIID_,regexp_substr(CA_PRODUCTID,'[^,]+',1,level) as CA_PRODUCTID, CA_CITY, CA_LANGUAGE, 1 as ENTRY_ID FROM ( 

                    SELECT DISTINCT $A$.RIID_,$A$.CA_PRODUCTID,REGEXP_REPLACE($A$.CA_CITY,'~','') CA_CITY, REGEXP_REPLACE($A$.CA_LANGUAGE,'~','') CA_LANGUAGE FROM $A$ 
                    WHERE TO_CHAR( $A$.MODIFIED_DATE_, 'DD-MM-YYYY') =TO_CHAR(current_timestamp ,'DD-MM-YYYY')
                    
                ) TEMP CONNECT BY level<=regexp_count(CA_PRODUCTID,',')+1 ORDER BY RIID_ 
                    
            )ps where CA_PRODUCTID is not null 
            
        ) ps ,xmltable(('"'|| REPLACE(ps.CA_PRODUCTID,'~', '","')|| '"')) d 
        
    )lk

)r, $B$ where $B$.DEAL_ID=r.CA_PRODUCTID