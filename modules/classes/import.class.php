<?php
/**
 * Created : 5 sept. 2017
 * Creator : quinton
 * Encoding : UTF-8
 * Copyright 2017 - All rights reserved
 */
class ImportException extends Exception {
    
}
/**
 * Classe de gestion des imports csv
 * @author quinton
 *
 */
 class Import {
     private $separator = ",";
     private $utf8_encode = false;
     private $handle;
     private $header = array();
     public $minuid, $maxuid;
     
     /**
      * Constructeur
      * @param string $filename
      * @param string $separator
      * @param boolean $utf_encode
      */
     function __construct($filename, $separator = ",", $utf_encode = false) {
         $this->initFile($filename, $separator, $utf_encode);
     }
     
     /**
      * Fonction d'initialisation du fichier
      * recupere la premiere ligne pour lire l'entete
      * @param string $filename
      * @param string $separator
      * @param boolean $utf8_encode
      * @throws ImportException
      */
     function initFile($filename, $separator = ",", $utf8_encode = false)
     {
         if ($separator == "tab") {
             $separator = "\t";
         }
             $this->separator = $separator;
             /*
              * Ouverture du fichier
              */
             if ($this->handle = fopen($filename, 'r')) {
                 $data = $this->readLine();
                 $range = 0;
                 /*
                  * Preparation des entetes
                  */
                 for ($range = 0; $range < count($data); $range ++) {
                     $this->header[$range] = $data[$range];
                 }
                
             }else {
                 throw new ImportException("$filename not found or not readable");
             }
     }
     /**
      * Lit une ligne dans le fichier
      *
      * @return array|NULL
      */
     function readLine()
     {
         if ($this->handle) {
             $data = fgetcsv($this->handle, 0, $this->separator);
             if ($data !== false) {
                 if ($this->utf8_encode) {
                     foreach ($data as $key => $value)
                         $data[$key] = utf8_encode($value);
                 }
             }
             return $data;
         } else
             return false;
     }
     /**
      * lit le fichier csv, et le retourne sous forme de tableau associatif
      * @return mixed[][]
      */
     function getContentAsArray() {
         $data = array();
         $nb = count($this->header);
         while (($line = $this->readLine()) !== false) {
             $dl = array();
             for ($i = 0; $i < $nb; $i ++) {
                 $dl[$this->header[$i]] = $line[$i];
             }
             $data[] = $dl;
         }
         return $data;
     }
     
     /**
      * Ferme le fichier
      */
     function fileClose()
     {
         if ($this->handle)
             fclose($this->handle);
     }
 }
?>