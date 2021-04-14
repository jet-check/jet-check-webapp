/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.io;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
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
    public boolean editFruehaufgaben(String text, String path) throws IOException {
        List<String> fruehaufgabn_old = getFruehaufgaben(path);
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(new File(path)))) {
            bw.write(text);
        }
        BufferedReader br = new BufferedReader(new FileReader(new File(path)));
        List<String> fruehaufgaben_new = br.lines().collect(Collectors.toList());
        return fruehaufgaben_new.size() > fruehaufgabn_old.size() && fruehaufgaben_new.containsAll(fruehaufgabn_old);
    }
    public boolean editZwischenaufgaben(String text, String path) throws IOException {
        List<String> zwischenaufgaben_old = getFruehaufgaben(path);
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(new File(path)))) {
            bw.write(text);
        }
        BufferedReader br = new BufferedReader(new FileReader(new File(path)));
        List<String> zwischenaufgaben_new = br.lines().collect(Collectors.toList());
        return zwischenaufgaben_new.size() > zwischenaufgaben_old.size() && zwischenaufgaben_new.containsAll(zwischenaufgaben_old);
    }
    public boolean editSpaetaufgaben(String text, String path) throws IOException {
        List<String> spaetaufgaben_old = getFruehaufgaben(path);
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(new File(path)))) {
            bw.write(text);
        }
        BufferedReader br = new BufferedReader(new FileReader(new File(path)));
        List<String> spaetaufgaben_new = br.lines().collect(Collectors.toList());
        return spaetaufgaben_new.size() > spaetaufgaben_old.size() && spaetaufgaben_new.containsAll(spaetaufgaben_old);
    }
}
