/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.io;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Matio Tawdrous
 */
public class IO_Access {
    public List<String> getFruehaufgaben(String path) throws FileNotFoundException, IOException {
        BufferedReader br = new BufferedReader(new FileReader(new File(path)));
        List<String> aufgaben = br.lines().collect(Collectors.toList());
        return aufgaben;
    }
    public List<String> getZwischenaufgaben(String path) throws FileNotFoundException, IOException {
        BufferedReader br = new BufferedReader(new FileReader(new File(path)));
        List<String> aufgaben = br.lines().collect(Collectors.toList());
        return aufgaben;
    }
    public List<String> getSpaetaufgaben(String path) throws FileNotFoundException, IOException {
        BufferedReader br = new BufferedReader(new FileReader(new File(path)));
        List<String> aufgaben = br.lines().collect(Collectors.toList());
        return aufgaben;
    }
}
