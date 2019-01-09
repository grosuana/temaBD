async function showTables() {
    let responseTable = {};
    let table = {};
    let title = {};
    let tableName = "Ana";
    let counter = 1;
    for (var i = 0; i < query.length; i++) {
    	//console.log("i este" + i)
    	title = document.getElementById("numet0" + (i+1));
    	queryToShow = document.getElementById("query0" + (i+1));
    	//console.log("numet0" + (i+1))
    	title.innerHTML = titles[i];
    	queryToShow.innerHTML = query[i];
    	
        console.log("t0" + (i + 1));
        axios.get('/customquery?name=' + tableName + '&query=' + query[i])
            .then(function(response) {

            	table = document.getElementById("t0" + counter++);
            	console.log(table)
            	responseTable = response.data;
            	//console.log("i este" + i)
                
                ////////////////////
                //table.innerHTML = "";

                let header = table.createTHead();
                let row1 = table.insertRow(0);
                console.log(responseTable);

                for (let j = 0; j < responseTable.columns.length; j++) {
                    let cell = row1.insertCell(j);
                    
                    cell.innerHTML = responseTable.columns[j].toString();
                    
                }


                for (let i = 1; i <= responseTable.rows; i++) {
                    let row = table.insertRow(i);
                    for (let j = 0; j < responseTable.columns.length; j++) {
                        let cell = row.insertCell(j);
                        //console.log(response.data.data[i - 1][j] == null);
                        if (responseTable.data[i - 1][j] != null) {
                            cell.innerHTML = responseTable.data[i - 1][j].toString();
                        } else {
                            cell.innerHTML = "'Null'";
                        }
                    }


                    ////////////////////
                }
            })
    }
}

//let query1 = "SELECT angajati.nume, angajati.prenume, salarii.codSalariu FROM angajati INNER JOIN salarii ON salarii.codSalariu = angajati.codSalariu;"
let query = [];
let titles = []
query[0] = "SELECT `obiecteMobilier`.`tip` AS 'Obiect mobilier', `obiecteMobilier`.`greutate`, `obiecteMobilier`.`terminat`, `fabrici`.`oras` AS 'Produs in' FROM `fabrici` LEFT JOIN `mobilaComanda`.`obiecteMobilier` ON `fabrici`.`codFabrica` = `obiecteMobilier`.`codFabrica` WHERE `obiecteMobilier`.`terminat` = 'NU' ";
query[1] = "SELECT `clienti`.`nume`, `clienti`.`prenume`, `obiecteMobilier`.`tip` AS Produs, `transporturi`.`efectuat` AS Livrat FROM `clienti` INNER JOIN `mobilaComanda`.`comenzi` ON `clienti`.`codClient` = `comenzi`.`codClient` INNER JOIN `mobilaComanda`.`obiecteMobilier` ON `comenzi`.`codComanda` = `obiecteMobilier`.`codComanda` INNER JOIN `mobilaComanda`.`transporturi` ON `obiecteMobilier`.`codTransport` = `transporturi`.`codTransport` ";
query[2] = "SELECT `obiecteMobilier`.`tip`, `fabrici`.`strada`, `fabrici`.`oras` FROM `fabrici` LEFT JOIN `mobilaComanda`.`obiecteMobilier` ON `fabrici`.`codFabrica` = `obiecteMobilier`.`codFabrica` WHERE `obiecteMobilier`.`terminat` = 'NU' ";
titles[0] = "Poduse in lucru:";
titles[1] = "Status livrare produse:"
titles[2] = "Fabrici ce mai au de produs obiecte:"
showTables();
