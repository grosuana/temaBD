async function showTables() {
    let responseTable = {};
    let table = {};
    let title = {};
    let tableName = "Ana";
    let counter = 1;
    for (var i = 0; i < query.length; i++) {
        //console.log("i este" + i)
        title = document.getElementById("numet0" + (i + 1));
        queryToShow = document.getElementById("query0" + (i + 1));
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
query[0] = "SELECT `angajati`.`nume`, `angajati`.`prenume`, `salarii`.`valoare` FROM `salarii` INNER JOIN `mobilaComanda`.`angajati` ON `salarii`.`codSalariu` = `angajati`.`codSalariu` ORDER BY `angajati`.`nume` ASC ";
query[1] = "SELECT `angajati`.`nume`, `angajati`.`prenume`, `angajatiComenzi`.`codComanda`, `clienti`.`nume` AS 'Nume client', `clienti`.`prenume` AS 'Prenume client' FROM `angajati` INNER JOIN `mobilaComanda`.`angajatiComenzi` ON `angajati`.`codAngajat` = `angajatiComenzi`.`codAngajat` INNER JOIN `mobilaComanda`.`comenzi` ON `angajatiComenzi`.`codComanda` = `comenzi`.`codComanda` INNER JOIN `mobilaComanda`.`clienti` ON `comenzi`.`codClient` = `clienti`.`codClient` "
query[2] = "SELECT `angajati`.`nume`, `angajati`.`prenume`, `angajatiComenzi`.`codComanda`, `angajatiComenzi`.`timpAlocat` FROM `angajati` INNER JOIN `mobilaComanda`.`angajatiComenzi` ON `angajati`.`codAngajat` = `angajatiComenzi`.`codAngajat` "
query[3] = "SELECT `angajati`.`nume`, `angajati`.`prenume`, `comenzi`.`deadline`, `obiecteMobilier`.`tip` FROM `angajati` INNER JOIN `mobilaComanda`.`angajatiComenzi` ON `angajati`.`codAngajat` = `angajatiComenzi`.`codAngajat` INNER JOIN `mobilaComanda`.`comenzi` ON `angajatiComenzi`.`codComanda` = `comenzi`.`codComanda` INNER JOIN `mobilaComanda`.`obiecteMobilier` ON `comenzi`.`codComanda` = `obiecteMobilier`.`codComanda` WHERE `obiecteMobilier`.`terminat` = 'NU' ";
titles[0] = "Statusul angajatilor:";
titles[1] = "Repartizarea angajatilor pe comenzi:";
titles[2] = "Timpul alocat de angajati comenzilor:";
titles[3] = "Lista angajatilor ce mai au de terminat produse:";

showTables();
